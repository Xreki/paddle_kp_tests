#!/bin/bash

python -c "import paddle; print(paddle.__version__)"

PADDLENLP_ROOT=/work/xpu/PaddleNLP
export PYTHONPATH=${PADDLENLP_ROOT}:$PYTHONPATH

export FLAGS_run_kp_kernel=1

#show_kernel_info=1
if [ ${show_kernel_info} = "1" ]; then
  export GLOG_vmodule=api=6,dygraph_api=6
  output_filename=log_bert_detail.txt
else
  output_filename=log_bert.txt
fi

python ${PADDLENLP_ROOT}/examples/language_model/bert/run_pretrain.py \
    --max_predictions_per_seq 20 \
    --learning_rate 1e-4 \
    --weight_decay 1e-2 \
    --adam_epsilon 1e-6 \
    --warmup_steps 10000 \
    --output_dir ./output \
    --logging_steps 1 \
    --save_steps 20000 \
    --model_type bert \
    --model_name_or_path bert-base-uncased \
    --input_dir ./data/wikicorpus_en_seqlen128 \
    --device=xpu \
    --max_steps=10 \
    --use_amp=False \
    --batch_size=32 2>&1 | tee ${output_filename}

