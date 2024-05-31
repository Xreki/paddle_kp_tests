#!/bin/bash

export FLAGS_run_kp_kernel=1
export GLOG_vmodule=api=6,dygraph_api=6
#export GLOG_vmodule=api=6,dygraph_api=6,broadcast_function=6,dims_simplifier=6
#export XPU_KPWHITE_LIST="reduce_sum,reduce_prod"
export XPURT_DISPATCH_MODE=PROFILING

python $1
