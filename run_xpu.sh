#!/bin/bash

export FLAGS_run_kp_kernel=1
export GLOG_vmodule=api=6,dygraph_api=6
export XPU_KPWHITE_LIST="reduce_sum,reduce_prod"

python $1
