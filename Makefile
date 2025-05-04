# Bump and release a new version
VERSION ?= $(shell git describe --tags --abbrev=0 2>/dev/null | awk -F. '{$$NF+=1; print $$1"."$$2"."$$NF}' OFS=. | sed 's/^v//')
TAG = v$(VERSION)

.PHONY: help release tag push

help:
	@echo "Makefile targets:"
	@echo "  make release VERSION=1.2.3   # Tag and push a new release"
	@echo "  make tag VERSION=1.2.3       # Create a local git tag"
	@echo "  make push                    # Push the latest tag to origin"

release: tag push

tag:
	@git tag -a $(TAG) -m "Release $(TAG)"
	@echo "Created tag $(TAG)"

push:
	@git push origin $(TAG)
	@echo "Pushed tag $(TAG)"
