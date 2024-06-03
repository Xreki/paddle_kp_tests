#!/bin/bash

export FLAGS_run_kp_kernel=1
export GLOG_vmodule=api=6,dygraph_api=6
export XPURT_DISPATCH_MODE=PROFILING

python $1
