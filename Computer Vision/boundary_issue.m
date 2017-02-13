%read image
img=imread('nature.png');

%create filter
fsize=31;
fsigma=10;
filter=fspecial('gaussian',fsize,fsigma);

%Apply to image
smoothed=imfilter(img,filter,0);
%smoothed=imfilter(img,filter,255);
%smoothed=imfilter(img,filter,'circular');
%smoothed=imfilter(img,filter,'reflection');
%smoothed=imfilter(img,filter,'symmetric');

imshow(smoothed);