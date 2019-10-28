
% Run row wise convolution with LowPass and HighPass Synthesis Filters
[Irows,Icols] = size(Image);
FilterLength = length(AnalysisLpFilter);

ImageRwConL = zeros(Irows,Icols + FilterLength-1);
ImageRwConH = zeros(Irows,Icols + FilterLength-1);

for i = 1:Irows
    ImageRwConL(i,:) = conv(Image(i,:),AnalysisLpFilter);
    ImageRwConH(i,:) = conv(Image(i,:),AnalysisHpFilter);
end

figure,subplot(2,1,1),imshow(ImageRwConL,[]);title('Low Pass Rowwise convolved');
subplot(2,1,2), imshow(ImageRwConH,[]);title('High Pass Rowwise convolved');

%% Subsample the image for each row

% I thought and found that irrespective of the filter size, the
% OriginAnalysis sufficent to get down sampling.

ImageRwConLSub = ImageRwConL(:,OriginAnalysis:2:end);
ImageRwConHSub = ImageRwConH(:,OriginAnalysis:2:end);

figure,subplot(2,1,1), imshow(ImageRwConLSub,[]); title('Low Pass Rowsiwe convolved then subsampled');
subplot(2,1,2), imshow(ImageRwConHSub,[]);title('High Pass Rowsiwe convolved then subsampled');

%% Now we will do convolution along the column of intermediate results.

[Irows,Icols] = size(ImageRwConLSub);
ImageRwConLSubColConLL = zeros(Irows + FilterLength-1,Icols);
ImageRwConLSubColConLH = ImageRwConLSubColConLL;
ImageRwConHSubColConHL = ImageRwConLSubColConLL;
ImageRwConHSubColConHH = ImageRwConLSubColConLL;

for i = 1:Icols
    ImageRwConLSubColConLL(:,i) = conv(ImageRwConLSub(:,i),AnalysisLpFilter);
    ImageRwConLSubColConLH(:,i) = conv(ImageRwConLSub(:,i),AnalysisHpFilter);
    ImageRwConHSubColConHL(:,i) = conv(ImageRwConHSub(:,i),AnalysisLpFilter);
    ImageRwConHSubColConHH(:,i) = conv(ImageRwConHSub(:,i),AnalysisHpFilter);
end

figure, subplot(2,2,1),imshow(ImageRwConLSubColConLL,[]);title('LowLow');
subplot(2,2,2), imshow(ImageRwConLSubColConLH,[]);title('LowHigh');
subplot(2,2,3), imshow(ImageRwConHSubColConHL,[]);title('HighLow');
subplot(2,2,4), imshow(ImageRwConHSubColConHH,[]);title('HighHigh');

%% Do subsampling along the cols now
ImageRwConLSubColConLLSub = ImageRwConLSubColConLL(OriginAnalysis:2:end,:);
ImageRwConLSubColConLHSub = ImageRwConLSubColConLH(OriginAnalysis:2:end,:);
ImageRwConHSubColConHLSub = ImageRwConHSubColConHL(OriginAnalysis:2:end,:);
ImageRwConHSubColConHHSub = ImageRwConHSubColConHH(OriginAnalysis:2:end,:);

figure, subplot(2,2,1),imshow(ImageRwConLSubColConLLSub,[]);title('LL')
subplot(2,2,2), imshow(ImageRwConLSubColConLHSub,[]);title('LH')
subplot(2,2,3), imshow(ImageRwConHSubColConHLSub,[]);title('HL')
subplot(2,2,4), imshow(ImageRwConHSubColConHHSub,[]);title('HH')
