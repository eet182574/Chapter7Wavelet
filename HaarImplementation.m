clc, clear all, close all;
ImageName = input('Enter image name: ','s');
Image = double(imread(ImageName));
figure, imshow(Image,[]),title('Original Image');