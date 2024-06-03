#!/bin/bash

wget -nc -P ./dataset/coco/ https://bj.bcebos.com/v1/paddledet/data/cocomini.zip --no-check-certificate
cd ./dataset/coco/ && unzip cocomini.zip
mv -u cocomini/* ./
ls ./
