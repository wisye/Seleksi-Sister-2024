package main

import (
	"bufio"
	"encoding/json"
	"fmt"
	"os"
	"strings"
)

type User struct {
	Username string `json:"username"`
	Password string `json:"password"`
}

func saveUsersToFile(users []User, filename string) error {
	data, err := json.MarshalIndent(users, "", "  ")
	if err != nil {
		return err
	}
	return os.WriteFile(filename, data, 0644)
}

func loadUsersFromFile(filename string) ([]User, error) {
	data, err := os.ReadFile(filename)
	if err != nil {
		return nil, err
	}
	var users []User
	err = json.Unmarshal(data, &users)
	return users, err
}

func registerUser(users []User, filename string) ([]User, error) {
	fmt.Print("Enter username: ")
	username := readInput()

	fmt.Print("Enter password: ")
	password := readInput()

	for _, user := range users {
		if user.Username == username {
			fmt.Println("Username already exists!")
			return users, nil
		}
	}

	newUser := User{Username: username, Password: password}
	users = append(users, newUser)
	err := saveUsersToFile(users, filename)
	if err != nil {
		return nil, err
	}

	fmt.Println("User registered successfully!")
	return users, nil
}

func loginUser(users []User) bool {
	fmt.Print("Enter username: ")
	username := readInput()

	fmt.Print("Enter password: ")
	password := readInput()

	for _, user := range users {
		if user.Username == username && user.Password == password {
			fmt.Println("Login successful!")
			return true
		}
	}

	fmt.Println("Invalid username or password!")
	return false
}

func readInput() string {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Scan()
	return strings.TrimSpace(scanner.Text())
}

func main() {
	filename := "users.json"

	users, err := loadUsersFromFile(filename)
	if err != nil {
		fmt.Println("Error loading users:", err)
		users = []User{}
	}

	for {
		fmt.Println("1. Register")
		fmt.Println("2. Login")
		fmt.Println("3. Exit")
		fmt.Print("Choose an option: ")
		option := readInput()

		switch option {
		case "1":
			users, err = registerUser(users, filename)
			if err != nil {
				fmt.Println("Error registering user:", err)
			}
		case "2":
			if loginUser(users) {
				fmt.Println("Welcome to hell")
			}
		case "3":
			fmt.Println("Exiting")
			return
		default:
			fmt.Println("Invalid option!")
		}
	}
}
