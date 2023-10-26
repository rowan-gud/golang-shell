VERSION_FILE=VERSION

.PHONY: major
major:
	semver up major > $(VERSION_FILE)

.PHONY: minor
minor:
	semver up minor > $(VERSION_FILE)

.PHONY: patch
patch:
	semver up patch > $(VERSION_FILE)

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
	conventional-changelog -p conventionalCommits -i CHANGELOG.md -s -r 0

.PHONY: tag
tag:
	git tag -a "$(shell cat $(VERSION_FILE))" -m "$(shell cat $(VERSION_FILE))"

.PHONE: tag-push
tag-push:
	git push origin $(shell cat $(VERSION_FILE))