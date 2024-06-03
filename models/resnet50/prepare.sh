#!/bin/bash 

WORK_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )"

DATASET_ROOT=${WORK_ROOT}/dataset/ILSVRC2012
if [ ! -d ${DATASET_ROOT} ]; then
  mpdir -p ${WORK_ROOT}/dataset
  cd ${WORK_ROOT}/dataset
  wget -nc https://paddle-imagenet-models-name.bj.bcebos.com/data/ImageNet1k/ILSVRC2012_val.tar
  tar xf ILSVRC2012_val.tar
  ln -s ILSVRC2012_val ILSVRC2012
  cd ILSVRC2012
  rm -rf train_list.txt
  ln -s val_list.txt train_list.txt
  head -n 320 val_list.txt > val_list_320images.txt
  ln -s val_list_320images.txt train_list_320images.txt
  cd ${WORK_ROOT}
fi
