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

#### [air](https://github.com/cosmtrek/air) - Live reloading

```sh
go install github.com/cosmtrek/air@latest
```

#### [ginkgo](https://github.com/onsi/ginkgo/v2/ginkgo) - Test suite bootstrapping

```sh
go install github.com/onsi/ginkgo/v2/ginkgo@latest
```

### Node.js Dependencies

#### [conventional-changelog](https://github.com/conventional-changelog/conventional-changelog) - Generating changelogs from structured commit messages

```sh
npm install -g conventional-changelog-cli
```

## Workflow

* Make changes in a separate branch
* Make atomic commits to make the PR easier to navigate
* Push changes
* Create a PR and squash the PR into a commit which uses [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0) (valid verbs listed below)

> NOTE: you can use the `Refs` footer to include issues or tickets

* Make a release PR which includes version bump, new tag, changelog when ready to release

> NOTE: Using this structure, not every PR has to be associated to an issue or ticket. This allows for better segmentation of PRs and provides a system to be easily able to identify changes


### Valid Commit Verbs

* feat - A new feature
* fix - A bug fix
* chore - A change which does not effect the functionality of the application (eg: updating dependencies, releases)
* ci - An update to ci files
* docs - An update to documentation
* perf - A performance improvement
* refactor - A refactor of existing code
* revert - A commit which reverts prior changes
* test - A commit containing only testing updates

> NOTE: multi-word scopes should be written in kebab case eg: `"feat(some-application-piece): add feature x"`

> NOTE: Branch naming should follow the above verbs. eg: `feat-add-feature-x` would translate to a commit message like `"feat(scope): add feature x"`

### Creating a Release

The `Makefile` contains targets for updating the version, tagging, and pushing tags. The `VERSION` file contains the current version of the project and is read into the tag that gets created.

> NOTE: If you are manually updating the version, make sure to do so in both the `VERSION` and `.semver.yaml` files.

* Create a release branch (`release-*`)
* Increment the version by using `make <major|minor|patch|rc|beta|alpha>`
* Create a tag using `make tag`
* Update the `CHANGELOG.md` file by running `make changelog`
* Push the changes to the release branch
* Push the tag either through `git push origin <tag_name>` or you can push the tag in the `VERSION` file by running `make tag-push`

### Building Tags (CI)

* On push should build an image with a tag based on the commit hash (probably just the short)
* On merge to main should pull the commit image and add a `latest` tag to it
* On tag push, checkout main + retag the commit hash build to `<tag_name>`

## Tests

Run all tests
```sh
go test ./...
```