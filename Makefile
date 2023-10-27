VERSION_FILE=VERSION

DOCKER_REPO=DOCKER_REPO
APP_NAME=APP_NAME

VIEWER=""

ifeq ($(OS), Windows_NT)
	VIEWER=start
else
	UNAME := $(shell uname -s)

	ifeq ($(UNAME), Darwin)
		VIEWER=open
	else
		VIEWER=xdg-open
	endif
endif

.PHONY: major
major:
	semver up major > $(VERSION_FILE)

.PHONY: minor
minor:
	semver up minor > $(VERSION_FILE)

.PHONY: patch
patch:
	semver up release > $(VERSION_FILE)

.PHONY: rc
rc:
	semver up rc > $(VERSION_FILE)

.PHONY: beta
beta:
	semver up beta > $(VERSION_FILE)

.PHONY: alpha
alpha:
	semver up alpha > $(VERSION_FILE)

.PHONY: changelog
changelog:
	conventional-changelog -p conventionalCommits -i CHANGELOG.md -s --skip-unstable -r 0

.PHONY: tag
tag:
	git tag -a "$(shell cat $(VERSION_FILE))" -m "$(shell cat $(VERSION_FILE))"

.PHONE: tag-push
tag-push:
	git push origin $(shell cat $(VERSION_FILE))

.PHONY: build
build:
	docker compose -f deployments/docker-compose.local.yaml build

.PHONY: dev
dev:
	docker compose -f deployments/docker-compose.local.yaml up

.PHONY: build-docker
build-docker:
	docker build -f build/package/Dockerfile.production -t $(DOCKER_REPO)/$(APP_NAME) .

.PHONY: test
test:
	go test -cover -coverprofile=coverage.out ./...
	go tool cover -html=coverage.out -o coverage.html
	$(VIEWER) coverage.html