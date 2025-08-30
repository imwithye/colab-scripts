.PHONY: docker
docker:
	docker run --rm -it -v .:/content/colab-scripts --entrypoint /bin/bash us-docker.pkg.dev/colab-images/public/runtime