#!/bin/bash

# Basic environment installs
apt update
apt upgrade -y
apt install -y libsm6 libxext6 libxrender-dev wget

# Pip installs
pip install opencv-python

# Download and extract dataset
wget http://www.vision.caltech.edu/visipedia-data/CUB-200-2011/CUB_200_2011.tgz -O CUB_200_2011.tgz
mkdir dataset
tar -xf CUB_200_2011.tgz
mv -f CUB_200_2011 dataset/
rm CUB_200_2011.tgz

# Text data download and extract
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1O_LtUP9sch09QH3s_EBAgLEctBQ5JBSJ' -O birds.zip
unzip -o birds.zip
rm birds.zip
rm -rf __MACOSX
mkdir dataset/CUB_200_2011/text
mv birds/captions.pickle dataset/CUB_200_2011/text/bird_captions.pickle
mv birds/test/filenames.pickle dataset/CUB_200_2011/text/filenames_test.pickle
mv birds/train/filenames.pickle dataset/CUB_200_2011/text/filenames_train.pickle
mv birds/train/class_info.pickle dataset/CUB_200_2011/text/class_info.pickle
rm -rf birds

