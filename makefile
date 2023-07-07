# Makefile

# Variables
BUILD_DIR = _build/default
BIN_DIR = $(BUILD_DIR)/bin
TEST_DIR = $(BUILD_DIR)/test

# Build the project
build:
	dune build

# Run the project
run: build
	dune exec $(BIN_DIR)/main.exe

# Run tests
test:
	dune runtest

# Clean the build artifacts
clean:
	dune clean
