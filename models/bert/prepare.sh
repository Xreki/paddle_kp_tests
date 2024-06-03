#!/bin/bash

wget -nc -P ./data/ https://bj.bcebos.com/paddlenlp/datasets/benchmark_wikicorpus_en_seqlen128.tar --no-check-certificate

cd ./data/
tar -xf benchmark_wikicorpus_en_seqlen128.tar

cd ..

pip install h5py
