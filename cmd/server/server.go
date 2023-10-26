// Package main is the entrypoint to the binary. Packages inside `cmd` should be very skinny
// most of the logic should be in either pkg or internal
package main

import (
	"log"

	internal "github.com/rowan-gud/golang-shell/internal/internal-lib"
	ext "github.com/rowan-gud/golang-shell/pkg/external-lib"
)

func main() {
	i := internal.LibFunction()
	e := ext.LibFunction()

	log.Printf("%s - Internal", i)
	log.Printf("%s - External", e)
}
