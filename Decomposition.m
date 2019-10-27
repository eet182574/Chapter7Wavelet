
% Run row wise convolution with LowPass and HighPass Synthesis Filters
[Irows,Icols] = size(Image);
FilterLength = length(AnalysisLpFilter);

ImageRwConL = zeros(Irows,Icols + FilterLength-1);
ImageRwConH = zeros(Irows,Icols + FilterLength-1);

for i = 1:Irows
    ImageRwConL(i,:) = conv(Image(i,:),AnalysisLpFilter);
    ImageRwConH(i,:) = conv(Image(i,:),AnalysisHpFilter);
end

figure, imshow(ImageRwConL,[]);
figure, imshow(ImageRwConH,[]);

