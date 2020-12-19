clear all
clc
close all
%%%%%% This code is for paper"Component decomposition-based hyperspectral 
%%%%%% resolution enhancement for mineral mapping"
load img
HSI=HSIimg;
RGB=RGBimg;
tic;
downsamp_factor = 4; 
HSI_Down = downsamp_HS(HSI, downsamp_factor, 1);

HSIC=rgb2ycbcr(RGB);
I=HSIC(:,:,1);% illumination component
S=imresize(I,[size(HSI_Down,1) size(HSI_Down,2)]);
for i=1:size(HSI_Down,3)
RC(:,:,i)=HSI_Down(:,:,i)./S;
end
% estimation of reflectance component
for i=1:size(HSI_Down,3)
RL2(:,:,i)=imresize(RC(:,:,i),[size(HSI,1) size(HSI,2)]);
end
% reconstruction
for i=1:size(HSI_Down,3)
Result(:,:,i)=RL2(:,:,i).*I;
end
toc
