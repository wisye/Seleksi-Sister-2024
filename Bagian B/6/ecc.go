package main

import (
	"crypto/rand"
	"math/big"
)

type EllipticCurve struct {
	A, B, P *big.Int
	G       *Point
	N       *big.Int
}

type Point struct {
	X, Y *big.Int
}

// Elliptic Curve: y^2 = x^3 + ax + b/F_p
func NewEllipticCurve(a, b, p, gX, gY, n *big.Int) *EllipticCurve {
	return &EllipticCurve{
		A: a,
		B: b,
		P: p,
		G: &Point{X: gX, Y: gY},
		N: n,
	}
}

func (curve *EllipticCurve) Add(p1, p2 *Point) *Point {
	if p1 == nil {
		return p2
	}
	if p2 == nil {
		return p1
	}

	lambda := new(big.Int)
	temp := new(big.Int)

	if p1.X.Cmp(p2.X) == 0 && p1.Y.Cmp(p2.Y) == 0 {
		// lambda = (3*x1^2 + a) / (2*y1) (mod p)
		temp.Mul(big.NewInt(3), p1.X)
		temp.Mul(temp, p1.X)
		temp.Add(temp, curve.A)
		denominator := new(big.Int).Mul(big.NewInt(2), p1.Y)
		denominator.Mod(denominator, curve.P)
		denominator.ModInverse(denominator, curve.P)
		lambda.Mul(temp, denominator)
		lambda.Mod(lambda, curve.P)
	} else {
		// lambda = (y2 - y1) / (x2 - x1) (mod p)
		temp.Sub(p2.Y, p1.Y)
		denominator := new(big.Int).Sub(p2.X, p1.X)
		denominator.Mod(denominator, curve.P)
		denominator.ModInverse(denominator, curve.P)
		lambda.Mul(temp, denominator)
		lambda.Mod(lambda, curve.P)
	}

	// x3 = lambda^2 - x1 - x2 (mod p)
	x3 := new(big.Int).Mul(lambda, lambda)
	x3.Sub(x3, p1.X)
	x3.Sub(x3, p2.X)
	x3.Mod(x3, curve.P)

	// y3 = lambda*(x1 - x3) - y1 (mod p)
	y3 := new(big.Int).Sub(p1.X, x3)
	y3.Mul(lambda, y3)
	y3.Sub(y3, p1.Y)
	y3.Mod(y3, curve.P)

	return &Point{X: x3, Y: y3}
}

func (curve *EllipticCurve) ScalarMult(k *big.Int, p *Point) *Point {
	var result *Point
	for i := k.BitLen() - 1; i >= 0; i-- {
		result = curve.Add(result, result)
		if k.Bit(i) == 1 {
			result = curve.Add(result, p)
		}
	}
	return result
}

func GenerateKeyPair(curve *EllipticCurve) (*big.Int, *Point) {
	priv, err := rand.Int(rand.Reader, curve.N)
	if err != nil {
		panic(err)
	}
	pub := curve.ScalarMult(priv, curve.G)
	return priv, pub
}

func ComputeSharedSecret(curve *EllipticCurve, priv *big.Int, pub *Point) *Point {
	return curve.ScalarMult(priv, pub)
}