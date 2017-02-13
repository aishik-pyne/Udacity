% Load and convert image to double type, range [0, 1] for convenience
img = double(rgb2gray(imread('tiger.jpg')))/255.0; 
%imshow(img); % assumes [0, 1] range for double images

% Compute x, y gradients
[gx,gy] = imgradientxy(img, 'sobel'); % Note: gx, gy are not normalized


%Obtain gradient magnitude 
[gMag,gDir]=imgradient(gx,gy);
gMag=gMag/(4*sqrt(2));
gDir=(gDir+180)/360;
%figure; imshowpair(gx, gy, 'montage');
%figure; imshow(gMag);
%figure; imshow(gDir);

% Find pixels with desired gradient direction
my_grad = select_gDir(gMag, gDir, 1, 30, 60); % 45 +/- 15
imshow(my_grad);  % NOTE: enable after you've implemented select_gdir


%{
filt=fspecial('sobel');

outImg=imfilter(double(img)/255,filt);
outImg
figure,imshow(outImg);
colormap gray
%}

