# Based on https://github.com/philpep/dockerfiles/blob/a2c3a858cb08427149875d40e085f701e62e160d/Makefile

DOCKERFILES=$(shell find * -type f -name Dockerfile)
NAMES=$(subst /,\:,$(subst /Dockerfile,,$(DOCKERFILES)))
#REGISTRY?=docker.io
REGISTRY?=local
IMAGES=$(addprefix $(subst :,\:,$(REGISTRY))/,$(NAMES))
DEPENDS=.depends.mk
MAKEFLAGS += -rR

export DOCKER_BUILDKIT=1

.PHONY: all clean push pull run exec check checkrebuild pull-base ci $(NAMES) $(IMAGES)

all: $(NAMES)

help:
	@echo "A smart Makefile for your dockerfiles"
	@echo ""
	@echo "Read all Dockerfile within the current directory and generate dependendies automatically."
	@echo ""
	@echo "make all              ; build all images"
	@echo "make chromium         ; build chromium image"
	@echo "make push all         ; build and push all images"
	@echo "make push chromium    ; build and push chromium image"
	@echo "make run chromium     ; build and run chromium image (for testing)"
	@echo "make exec chromium    ; build and start interactive shell in chromium image (for debugging)"
	@echo "make checkrebuild all ; build and check if image has update availables (using apk or apt-get)"
	@echo "                        and rebuild with --no-cache if image has updates"
	@echo "make pull-base        ; pull base images from docker hub used to bootstrap other images"
	@echo "make ci               ; alias to make pull-base checkrebuild all"
	@echo "make publish          ; alias to make pull-base checkrebuild push all"
	@echo ""
	@echo "You can chain actions, typically in CI environment you want make checkrebuild push all"
	@echo "which rebuild and push only images having updates availables."

clean:
	rm -f alpine/edge/rootfs.tar.xz
	rm -f alpine/3.15/rootfs.tar.xz
	rm -f $(DEPENDS)

$(subst :,\:,$(REGISTRY))/alpine\:edge: alpine/edge/rootfs.tar.xz
$(subst :,\:,$(REGISTRY))/alpine\:3.15: alpine/3.15/rootfs.tar.xz

pull-base:
	# Used by alpine:builder
	docker pull alpine:3.15

ci:
	$(MAKE) pull-base checkrebuild all

publish:
	$(MAKE) pull-base checkrebuild push all

alpine/edge/rootfs.tar.xz:
	$(MAKE) $(REGISTRY)/alpine:builder
	docker run --rm $(REGISTRY)/alpine:builder -r edge -m http://dl-cdn.alpinelinux.org/alpine -b -t UTC \
		-p alpine-baselayout,busybox,alpine-keys,apk-tools,libc-utils -s > $@

alpine/3.15/rootfs.tar.xz:
	$(MAKE) $(REGISTRY)/alpine:builder
	docker run --rm $(REGISTRY)/alpine:builder -r v3.15 -m http://dl-cdn.alpinelinux.org/alpine -b -t UTC \
		-p alpine-baselayout,busybox,alpine-keys,apk-tools,libc-utils -s > $@

.PHONY: $(DEPENDS)
$(DEPENDS): $(DOCKERFILES)
	grep '^FROM \$$REGISTRY/' $(DOCKERFILES) | \
		awk -F '/Dockerfile:FROM \\$$REGISTRY/' '{ print $$1 " " $$2 }' | \
		sed 's@[:/]@\\:@g' | awk '{ print "$(subst :,\\:,$(REGISTRY))/" $$1 ": " "$(subst :,\\:,$(REGISTRY))/" $$2 }' > $@

sinclude $(DEPENDS)

$(NAMES): %: $(REGISTRY)/%
ifeq (push,$(filter push,$(MAKECMDGOALS)))
	docker push $<
endif
ifeq (run,$(filter run,$(MAKECMDGOALS)))
	docker run --rm -it $<
endif
ifeq (exec,$(filter exec,$(MAKECMDGOALS)))
	docker run --entrypoint sh --rm -it $<
endif
ifeq (check,$(filter check,$(MAKECMDGOALS)))
	./check_update.sh $<
endif

$(IMAGES): %:
ifeq (pull,$(filter pull,$(MAKECMDGOALS)))
	docker pull $@
else
	docker build --build-arg REGISTRY=$(REGISTRY) -t $@ $(subst :,/,$(subst $(REGISTRY)/,,$@))
endif
ifeq (checkrebuild,$(filter checkrebuild,$(MAKECMDGOALS)))
	./check_update.sh $@ || (docker build --build-arg REGISTRY=$(REGISTRY) --no-cache -t $@ $(subst :,/,$(subst $(REGISTRY)/,,$@)) && ./check_update.sh $@)
endif
