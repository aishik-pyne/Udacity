% Apply a Gaussian filter to remove noise
img =imread('windows-8-wallpapers-2560x1600-233.jpg');

imshow(img);
disp(size(img));
% TODO: Add noise to the image
noise_sigma=30;
noise=randn(size(img));
img=img+noise*noise_sigma;
imshow(img);
% TODO: Now apply a Gaussian filter to smooth out the noise
% Note: You may need to pkg load image;
hsize=31;
sigma=10;
h=fspecial('gaussian',hsize,sigma);

smooth=imfilter(img,h);
imshow(img);
%{
hsize=101;
sigma=4;

%h=fspecial('gaussian',hsize,sigma);

 %surf(h);
 
 %imagesc(h);
 
 %filim=imfilter(img,h);
 %imshow(filim);
}%