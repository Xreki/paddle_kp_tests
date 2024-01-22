#!/bin/bash

export CUDA_VISIBLE_DEVICES="0"

# python -m pip install paddlepaddle-gpu==2.6.0 -i https://pypi.tuna.tsinghua.edu.cn/simple
# bash NsightSystems-linux-public-2023.4.1.97-3355750.run
export PATH=/opt/nvidia/nsight-systems/2023.4.1/bin:$PATH

export GLOG_vmodule=dygraph_functions=6

filename=$1
output=$(echo "$filename" | sed "s/.py//")
nsys_args="nsys profile --stats true -w true -t cuda -x true --force-overwrite true -o $output"
${nsys_args} python $filename 2>&1 | tee log_${output}_20240122.txt
