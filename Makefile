default: run

run:
	@go run routes.go ceylex.go

release-amd64:
	@rm -rf ceylex
	@CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o ceylex -ldflags "-s -w" -trimpath routes.go ceylex.go
