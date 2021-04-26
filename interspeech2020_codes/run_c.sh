#!/bin/sh

#SBATCH --partition=dfl
#SBATCH --time=999:00:00
#SBATCH --mem=20000
#SBATCH --gres=gpu:1
#SBATCH --ntasks=4
#SBATCH --get-user-env
#SBATCH --export=ALL
#SBATCH --mail-type=all
#SBATCH --mail-user=zijiang.yang@student.uni-augsburg.de
#SBATCH -o slurm.out
#SBATCH -J vaw_c_sle

source ../../miniconda3/bin/activate vawgan

cd ./vaw-gan-f0

python3 convert-vawgan-separate-f0.py --checkpoint_f0_cwt '/nas/staff/data_work/Zijiang/EmoV-DB_sorted/for_conversion/vawgan/sle/logdir_f0/train/0417-0544-27-2021/model.ckpt-46860' --trg 'Sleepy' --output_dir '/nas/staff/data_work/Zijiang/EmoV-DB_sorted/for_conversion/vawgan/sle/logdir_f0' --file_pattern '/nas/staff/data_work/Zijiang/EmoV-DB_sorted/for_conversion/vawgan/sle/data_f0/bin/evaluation_set/{}/*.bin'
python3 convert-vawgan-separate-f0.py --checkpoint_f0_cwt '/nas/staff/data_work/Zijiang/EmoV-DB_sorted/for_conversion/vawgan/sle/logdir_f0/train/0417-0544-27-2021/model.ckpt-46860' --trg 'Sleepy' --output_dir '/nas/staff/data_work/Zijiang/EmoV-DB_sorted/for_conversion/vawgan/sle/logdir_f0' --file_pattern '/nas/staff/data_work/Zijiang/EmoV-DB_sorted/for_conversion/vawgan/sle/data_f0/bin/evaluation_set/{}/*.bin'
python3 save_f0.py

cd ../vaw-gan

python3 test-condition.py
python3 convert-vawgan-cwt.py --checkpoint '/nas/staff/data_work/Zijiang/EmoV-DB_sorted/for_conversion/vawgan/sle/logdir/train/0417-0518-38-2021/model.ckpt-46860' --trg 'Sleepy' --output_dir '/nas/staff/data_work/Zijiang/EmoV-DB_sorted/for_conversion/vawgan/sle/logdir'
python3 convert-vawgan-cwt.py --checkpoint '/nas/staff/data_work/Zijiang/EmoV-DB_sorted/for_conversion/vawgan/sle/logdir/train/0417-0518-38-2021/model.ckpt-46860' --trg 'Sleepy' --output_dir '/nas/staff/data_work/Zijiang/EmoV-DB_sorted/for_conversion/vawgan/sle/logdir'
