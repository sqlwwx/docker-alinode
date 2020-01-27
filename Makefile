build:
	docker build -t sqlwwx/alinode:5.13.0 -t sqlwwx/alinode:latest .
	docker build -f Dockerfile.git -t sqlwwx/alinode-git:5.13.0 -t sqlwwx/alinode-git:latest .
	docker build -f Dockerfile.builder -t sqlwwx/alinode-builder:5.13.0 -t sqlwwx/alinode-builder:latest .

publish:
	docker push sqlwwx/alinode:5.13.0
	docker push sqlwwx/alinode:latest
	docker push sqlwwx/alinode-git:5.13.0
	docker push sqlwwx/alinode-git:latest
	docker push sqlwwx/alinode-builder:5.13.0
	docker push sqlwwx/alinode-builder:latest

.PHONY: build publish
