###! /bin/bash
##
#scripts=$(dirname "$0")
#base=$scripts/..
#
#models=$base/models
#configs=$base/configs
#
#mkdir -p $models
#
#num_threads=10
##device=0
#
## measure time
#
#SECONDS=0
#
#logs=$base/logs
#
#model_name=deen_transformer_regular
#
#mkdir -p $logs
#
#mkdir -p $logs/$model_name
#
#OMP_NUM_THREADS=$num_threads python -m joeynmt train $configs/$model_name.yaml > $logs/$model_name/out 2> $logs/$model_name/err
#
#echo "time taken:"
#echo "$SECONDS seconds"

#!/bin/bash

scripts=$(dirname "$0")
base=$scripts/..

models=$base/models
configs=$base/configs

mkdir -p $models

num_threads=10

# measure time
SECONDS=0

logs=$base/logs

# Train Pre-Norm Model
model_name="deen_transformer_pre"
mkdir -p $logs/$model_name
OMP_NUM_THREADS=$num_threads python -m joeynmt train $configs/$model_name.yaml > $logs/$model_name/out 2> $logs/$model_name/err
echo "Time taken for pre-norm model: $SECONDS seconds"

# Reset timer
SECONDS=0

# Train Post-Norm Model
model_name="deen_transformer_post"
mkdir -p $logs/$model_name
OMP_NUM_THREADS=$num_threads python -m joeynmt train $configs/$model_name.yaml > $logs/$model_name/out 2> $logs/$model_name/err
echo "Time taken for post-norm model: $SECONDS seconds"
