img=rgb2gray(imread('nature.png'));
imshow(img);
%%Add noise Salt and pepper
noise_img=imnoise(img,'salt & pepper',0.02);
figure,imshow(noise_img);
smoothed=medfilt2(noise_img);
figure,imshow(smoothed);