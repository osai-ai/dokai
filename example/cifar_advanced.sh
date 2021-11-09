#!/bin/bash
NUM_PROC=$1
shift
torchrun --standalone --nnodes=1 --nproc_per_node=$NUM_PROC cifar_advanced.py "$@"
