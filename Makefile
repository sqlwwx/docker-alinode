COMMIT_HASH = $(shell git rev-parse --short HEAD)
RELEASES = patch minor major

build:
	docker build -t sqlwwx/alinode:$(COMMIT_HASH) -t sqlwwx/alinode:latest .
	docker build -f Dockerfile.git -t sqlwwx/alinode-git:$(COMMIT_HASH) -t sqlwwx/alinode-git:latest .
	docker build -f Dockerfile.builder -t sqlwwx/alinode-builder:$(COMMIT_HASH) -t sqlwwx/alinode-builder:latest .

publish:
	docker push sqlwwx/alinode:$(COMMIT_HASH)
	docker push sqlwwx/alinode:latest
	docker push sqlwwx/alinode-git:$(COMMIT_HASH)
	docker push sqlwwx/alinode-git:latest
	docker push sqlwwx/alinode-builder:$(COMMIT_HASH)
	docker push sqlwwx/alinode-builder:latest

all: build publish

.PHONY: $(RELEASES)
$(RELEASES):
	$(PWD)/node_modules/.bin/standard-version --release-as $@
	git push --follow-tags origin master

.PHONY: build publish
