# Golang Shell Repo

## Dependencies

* [Go](https://go.dev/doc/install)
* [Node.js](https://nodejs.org)
* [Docker + compose](https://docs.docker.com/desktop/)

### Go binary dependencies

#### [goimports](https://pkg.go.dev/golang.org/x/tools/cmd/goimports) - Extended formatting
```sh
go install golang.org/x/tools/cmd/goimports@latest
```

#### [revive](https://github.com/mgechev/revive) - Stricter configurable linter
```sh
go install github.com/mgechev/revive@latest
```

#### [semver](https://github.com/maykonlf/semver-cli) - Project versioning
```sh
go install github.com/maykonlf/semver-cli/cmd/semver@latest
```

#### [husky](https://github.com/go-courier/husky) - Git hooks
```sh
go install github.com/go-courier/husky/cmd/husky@latest
```

#### [air](https://github.com/cosmtrek/air) - Live Reloading
```sh
go install github.com/cosmtrek/air@latest
```

### Node.js Dependencies

#### [conventional-changelog](https://github.com/conventional-changelog/conventional-changelog) - Generating changelogs from structured commit messages
```sh
npm install -g conventional-changelog-cli
```