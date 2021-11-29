#!/bin/bash
DATASETS=(
 "dermamnist"
 "breastmnist"
 "nodulemnist3d"
 "synapsemnist3d"
)

MODELS=(
  "DenseNet"
  "SEResNet50"
)


for model in "${MODELS[@]}"
    do
        for dataset in "${DATASETS[@]}"
        do
            echo "$model" "$dataset"
            papermill -p medmnist_dataset "$dataset" -p monai_model "$model" medmnist-monai-pot.ipynb | jupyter nbconvert --stdin --output medmnist_"$model"_"$dataset".html --output-dir medmnist_monai_notebooks --to html
        done
    done

