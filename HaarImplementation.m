clc, clear all, close all;
ImageName = input('Enter image name: ','s');
Image = double(imread(ImageName));
figure, imshow(Image,[]),title('Original Image');

AnalysisLpFilter = [1 1] / sqrt(2);
AnalysisHpFilter = [-1 1] / sqrt(2);
OriginAnalysis = 2;
SynthesisLpFilter = [1 1] / sqrt(2);  
SynthesisHpFilter = [1 -1] / sqrt(2);
OriginSynthesis = 1; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% I will implement it till rowwise convolution first.   -> Done
% Next I will implement col sub sampling taking into consideration the
% origin of the filter.