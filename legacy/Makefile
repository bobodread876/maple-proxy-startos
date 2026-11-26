PACKAGE := maple-proxy
VERSION := $(shell yq -r '.version' manifest.yaml)
IMAGES := docker-images/x86_64.tar docker-images/aarch64.tar
IMAGE_INPUTS := Dockerfile start.sh manifest.yaml ../assets/ui/index.html ../assets/ui/nginx.conf
.DELETE_ON_ERROR:
.PHONY: all verify
all: verify

verify: $(PACKAGE).s9pk
	start-sdk verify s9pk $<

scripts/embassy.js: scripts/embassy.ts scripts/bundle.ts deno.lock
	deno run --lock=deno.lock --frozen --allow-read --allow-write --allow-env --allow-net scripts/bundle.ts

docker-images/x86_64.tar: PLATFORM := linux/amd64
docker-images/aarch64.tar: PLATFORM := linux/arm64
$(IMAGES): $(IMAGE_INPUTS)
	mkdir -p docker-images
	docker buildx build --platform $(PLATFORM) --tag start9/$(PACKAGE)/main:$(VERSION) -f Dockerfile -o type=docker,dest=$@ ..

$(PACKAGE).s9pk: $(IMAGES) scripts/embassy.js manifest.yaml instructions.md icon.png LICENSE
	start-sdk pack
