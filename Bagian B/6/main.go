package main

import (
	"fmt"
	"math/big"
)

func main() {
	p, _ := new(big.Int).SetString("FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFC2F", 16)
	a := big.NewInt(0)
	b := big.NewInt(7)
	gX, _ := new(big.Int).SetString("79BE667EF9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B16F81798", 16)
	gY, _ := new(big.Int).SetString("483ADA7726A3C4655DA4FBFC0E1108A8FD17B448A68554199C47D08FFB10D4B8", 16)
	n, _ := new(big.Int).SetString("FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364141", 16)

	curve := NewEllipticCurve(a, b, p, gX, gY, n)

	// Alice generates her key pair
	privA, pubA := GenerateKeyPair(curve)
	fmt.Printf("Alice's Private Key: %s\n", privA.Text(16))
	fmt.Printf("Alice's Public Key: (%s, %s)\n", pubA.X.Text(16), pubA.Y.Text(16))

	// Bob generates his key pair
	privB, pubB := GenerateKeyPair(curve)
	fmt.Printf("Bob's Private Key: %s\n", privB.Text(16))
	fmt.Printf("Bob's Public Key: (%s, %s)\n", pubB.X.Text(16), pubB.Y.Text(16))

	// Alice computes the shared secret using Bob's public key
	sharedSecretA := ComputeSharedSecret(curve, privA, pubB)
	fmt.Printf("Shared Secret (computed by Alice): (%s, %s)\n", sharedSecretA.X.Text(16), sharedSecretA.Y.Text(16))

	// Bob computes the shared secret using Alice's public key
	sharedSecretB := ComputeSharedSecret(curve, privB, pubA)
	fmt.Printf("Shared Secret (computed by Bob): (%s, %s)\n", sharedSecretB.X.Text(16), sharedSecretB.Y.Text(16))

	// Verify that both shared secrets are the same
	if sharedSecretA.X.Cmp(sharedSecretB.X) == 0 && sharedSecretA.Y.Cmp(sharedSecretB.Y) == 0 {
		fmt.Println("Shared secrets match")
	} else {
		fmt.Println("Shared secrets do not match")
	}

	// Derive AES keys from the shared secret
	keyA := deriveAESKey(sharedSecretA)
	keyB := deriveAESKey(sharedSecretB)

	// Alice sends an encrypted message to Bob
	message := "what's up alice, this is bob"
	ciphertext, err := encryptAES(keyA, []byte(message))
	if err != nil {
		panic(err)
	}
	fmt.Printf("Encrypted message from Alice to Bob: %x\n", ciphertext)

	// Bob decrypts the message from Alice
	plaintext, err := decryptAES(keyB, ciphertext)
	if err != nil {
		panic(err)
	}
	fmt.Printf("Decrypted message by Bob: %s\n", string(plaintext))
}