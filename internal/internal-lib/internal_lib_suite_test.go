package internallib_test

import (
	"testing"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
)

func TestInternalLib(t *testing.T) {
	RegisterFailHandler(Fail)
	RunSpecs(t, "InternalLib Suite")
}
