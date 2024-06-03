#!/bin/bash

python -c "import paddle; print(paddle.__version__)"

CLAS_ROOT=/work/xpu/PaddleClas

WORK_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )"
DATASET_ROOT=${WORK_ROOT}/dataset/ILSVRC2012

export FLAGS_run_kp_kernel=1

#show_kernel_info=1
if [ ${show_kernel_info} = "1" ]; then
  export GLOG_vmodule=api=6,dygraph_api=6
  output_filename=log_resnet50_detail.txt
else
  output_filename=log_resnet50.txt
fi

python ${CLAS_ROOT}/tools/train.py \
         -c ${CLAS_ROOT}/ppcls/configs/ImageNet/ResNet/ResNet50.yaml \
         -o Global.seed=1234 \
         -o Global.print_batch_step=1 \
         -o Global.device=xpu \
         -o Global.epochs=1 \
         -o Global.save_interval=10000 \
         -o Global.eval_interval=1 \
         -o Global.eval_during_train=False \
         -o DataLoader.Train.sampler.batch_size=32 \
         -o DataLoader.Train.dataset.image_root=${DATASET_ROOT} \
         -o DataLoader.Train.dataset.cls_label_path=${DATASET_ROOT}/train_list_320images.txt \
         -o DataLoader.Train.loader.num_workers=8 \
         -o DataLoader.Eval.dataset.image_root=${DATASET_ROOT} \
         -o DataLoader.Eval.dataset.cls_label_path=${DATASET_ROOT}/val_list_320images.txt 2>&1 | tee ${output_filename}
