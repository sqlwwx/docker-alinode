VERSION = 6.4.1
RELEASES = patch minor major

build:
	docker build -t sqlwwx/alinode:$(VERSION) -t sqlwwx/alinode:latest .
	# docker build -f Dockerfile.git -t sqlwwx/alinode-git:$(VERSION) -t sqlwwx/alinode-git:latest .
	# docker build -f Dockerfile.builder -t sqlwwx/alinode-builder:$(VERSION) -t sqlwwx/alinode-builder:latest .

publish:
	docker push sqlwwx/alinode:$(VERSION)
	docker push sqlwwx/alinode:latest
	docker push sqlwwx/alinode-git:$(VERSION)
	docker push sqlwwx/alinode-git:latest
	docker push sqlwwx/alinode-builder:$(VERSION)
	docker push sqlwwx/alinode-builder:latest

all: build publish

.PHONY: $(RELEASES)
$(RELEASES):
	$(PWD)/node_modules/.bin/standard-version --release-as $@
	git push --follow-tags origin master

.PHONY: build publish
