package internallib_test

import (
	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"

	internallib "github.com/rowan-gud/golang-shell/internal/internal-lib"
)

var _ = Describe("InternalLib", func() {
	Describe("LibFunction", func() {
		It("should return the expected string", func() {
			Expect(internallib.LibFunction()).To(Equal("Hello, World!"))
		})
	})
})
