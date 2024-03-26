#!/bin/bash
export MAMBA_ROOT_PREFIX=$PWD
export PATH=$PWD:$PATH
alias mm=micromamba
eval "$(micromamba shell hook -s posix)"
# micromamba activate