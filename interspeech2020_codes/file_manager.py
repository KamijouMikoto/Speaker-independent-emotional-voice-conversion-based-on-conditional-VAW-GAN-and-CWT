import shutil
import os

in_path = '/nas/staff/data_work/Zijiang/EmoV-DB_sorted/for_conversion/vawgan/all_emotions/data/wav/training_set/Sleepy/'
out_path = '/nas/staff/data_work/Zijiang/EmoV-DB_sorted/jenie/Sleepy/'

file_list = os.listdir(out_path)
counter = 0

for old_name in file_list:
    new_name = 'jenie_' + old_name
    shutil.copy2(out_path + old_name, in_path + new_name)
    counter += 1
    print('{}/{}'.format(counter, len(file_list)))