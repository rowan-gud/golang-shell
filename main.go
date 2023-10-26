// Package main should be a skinny module. Most of the logic should live either in
// internal or pkg
package main

import (
	"log"

	internallib "github.com/rowan-gud/golang-shell/internal/internal-lib"
	externallib "github.com/rowan-gud/golang-shell/pkg/external-lib"
)

func main() {
	internal := internallib.LibFunction()
	external := externallib.LibFunction()

	log.Printf("Internal - %s", internal)
	log.Printf("External - %s", external)
}
