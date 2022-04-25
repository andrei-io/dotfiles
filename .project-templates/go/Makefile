build: clean
	go build -o build/server main.go

run: build
	./build/server

dev:
	air -c .air.toml

clean:
	rm -rf build/


