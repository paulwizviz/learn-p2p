package main

import (
	"fmt"

	"github.com/libp2p/go-libp2p"
)

func main() {
	// start a libp2p node with default settings
	node, err := libp2p.New()
	if err != nil {
		panic(err)
	}

	// print the node's listening addresses
	for _, addr := range node.Addrs() {
		fmt.Println("Listen addresses:", addr)
	}

	// shut the node down
	if err := node.Close(); err != nil {
		panic(err)
	}
}
