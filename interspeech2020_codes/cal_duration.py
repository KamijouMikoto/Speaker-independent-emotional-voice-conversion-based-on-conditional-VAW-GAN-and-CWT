import librosa
import os

output_path = './temp/'

lens = 0
for filename in os.listdir(output_path):
    y, sr = librosa.load(output_path + filename, sr=16000)
    lens += len(y)

print(lens)
print(lens / sr)
