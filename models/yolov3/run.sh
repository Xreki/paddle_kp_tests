#!/bin/bash

python -c "import paddle; print(paddle.__version__)"

DETECTION_ROOT=/work/xpu/PaddleDetection

export FLAGS_run_kp_kernel=1

#show_kernel_info=1
if [ "${show_kernel_info}" = "1" ]; then
  export GLOG_vmodule=api=6,dygraph_api=6
  output_filename=log_yolov3_detail.txt
else
  output_filename=log_yolov3.txt
fi

python ${DETECTION_ROOT}/tools/train.py \
    -c ${DETECTION_ROOT}/configs/yolov3/yolov3_darknet53_270e_coco.yml \
    -o worker_num=4 LearningRate.base_lr=0.0001 log_iter=1 use_gpu=False use_xpu=True epoch=1 TrainReader.batch_size=8 TrainReader.shuffle=False 2>&1 | tee ${output_filename}
