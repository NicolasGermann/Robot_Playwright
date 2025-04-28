FILES := testcases/
MAKEFILE_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))
CONTAINER_PROVIDER := podman

all: process

image_exists: Dockerfile
	$(CONTAINER_PROVIDER) build -t robot $(MAKEFILE_DIR)
	touch image_exists

process: image_exists $(FILES)
	@for file in $(FILES); do \
		echo "Fuehre $$file" aus; \
		$(CONTAINER_PROVIDER) run --rm -v $(MAKEFILE_DIR):/workspace --env FILE=$$file robot:latest; \
	done
