#!/bin/bash

cd ./vaw-gan-f0

python convert-vawgan-separate-f0.py #Please custominze your checkpoint dir: --checkpoint "./log/train/[TIMESETP]/model.ckpt-[MODEL ID]"
python save_f0.py

cd ../vaw-gan

python test-condition.py
python convert-vawgan-cwt.py #Please custominze your checkpoint dir: --checkpoint "./log/train/[TIMESETP]/model.ckpt-[MODEL ID]"



