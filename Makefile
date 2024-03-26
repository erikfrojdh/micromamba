
# Find OS and ARCH to download the correct micromamba
OSNAME := $(shell uname -s)
ifeq (${OSNAME}, Linux)
	OS := linux
else ifeq (${OSNAME}, Darwin)
	OS := osx
endif
ARCH := $(shell uname -m)
ifeq (${ARCH}, x86_64)
	ARCH := 64
endif

default: micromamba

export MAMBA_ROOT_PREFIX := ${PWD}

micromamba: ## download micromamba
	curl -Ls https://micro.mamba.pm/api/micromamba/${OS}-${ARCH}/latest | tar -xvj --strip-components=1 -C . bin/micromamba
	echo ${MAMBA_ROOT_PREFIX}
	
clean: ## delete micromamba env
	rm micromamba
	# rm -rf .bin/

help: # from compiler explorer
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'