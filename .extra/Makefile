DOCKERFILES=$(shell find * -type f -name Dockerfile)
NAMES=$(subst /,\:,$(subst /Dockerfile,,$(DOCKERFILES)))
REGISTRY?=ghcr.io/maxmilton
IMAGES=$(addprefix $(subst :,\:,$(REGISTRY))/,$(NAMES))
MAKEFLAGS += -rR

export DOCKER_BUILDKIT=1

.PHONY: all pull exec $(NAMES) $(IMAGES)

all: $(NAMES)

$(NAMES): %: $(REGISTRY)/%
ifeq (exec,$(filter exec,$(MAKECMDGOALS)))
	docker run --entrypoint sh --rm -it $<
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
