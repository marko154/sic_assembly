package main

import (
	"io"
	"log"
	"net"
	"os"
	"os/exec"
)

func main() {
	listener, err := net.Listen("tcp", ":8080")

	if err != nil {
		log.Fatal("Failed to listen on port 8080")
	}
	defer listener.Close()
	log.Println("Listening on port 8080...")

	for {
		conn, err := listener.Accept()
		if err != nil {
			log.Println("Failed to accept connection", err)
			continue
		}
		go handleConnection(conn)
	}
}

func handleConnection(conn net.Conn) {
	log.Println("Serving connection...")
	// cmd := exec.Command("python3", "handler.py")
	cmd := exec.Command("java", "-jar", "../sictools.jar", "handler.asm")
	cmd.Stdin = io.Reader(conn)
	cmd.Stdout = io.MultiWriter(os.Stdout, conn)

	if err := cmd.Start(); err != nil {
		log.Println("Failed to start process", err)
	}

	if err := cmd.Wait(); err != nil {
		log.Println("Process finished with error: ", err)
	}
}
