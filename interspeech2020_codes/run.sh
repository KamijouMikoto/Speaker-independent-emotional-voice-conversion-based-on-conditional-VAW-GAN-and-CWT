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
#SBATCH -J vaw_sle

source ../../miniconda3/bin/activate vawgan
cd ./vaw-gan

python3 -u main-vawgan.py --logdir_root '/nas/staff/data_work/Zijiang/EmoV-DB_sorted/for_conversion/vawgan/sle/logdir'
