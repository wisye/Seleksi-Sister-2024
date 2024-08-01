package main

import (
	"encoding/json"
	"fmt"
	"net"
	"os"
	"strconv"
	"sync"
)

type User struct {
	Username string
	Password string
	PublicKey []byte
}

var (
	users = make(map[string]*User)
	mutex = &sync.Mutex{}
)

func handleConnection(conn net.Conn) {
	defer conn.Close()
	decoder := json.NewDecoder(conn)
	encoder := json.NewEncoder(conn)
	
	var msg map[string]string
	if err := decoder.Decode(&msg); err != nil {
		fmt.Println("Error decoding:", err)
		return
	}

	username := msg["username"]
	password := msg["password"]

	mutex.Lock()
	defer mutex.Unlock()

	switch msg["action"] {
	case "register":
		if _, exists := users[username]; exists {
			encoder.Encode(map[string]string{"status": "error", "message": "User already exists"})
			return
		}
		users[username] = &User{Username: username, Password: password}
		encoder.Encode(map[string]string{"status": "success", "message": "Registered successfully"})
	case "login":
		user, exists := users[username]
		if !exists || user.Password != password {
			encoder.Encode(map[string]string{"status": "error", "message": "Invalid credentials"})
			return
		}
		encoder.Encode(map[string]string{"status": "success", "message": "Login successful"})
	}
}

func main() {
	port := 8080
	listener, err := net.Listen("tcp", ":"+strconv.Itoa(port))
	if err != nil {
		fmt.Println("Error starting server:", err)
		os.Exit(1)
	}
	defer listener.Close()

	fmt.Println("Server started on port", port)
	for {
		conn, err := listener.Accept()
		if err != nil {
			fmt.Println("Error accepting connection:", err)
			continue
		}
		go handleConnection(conn)
	}
}
