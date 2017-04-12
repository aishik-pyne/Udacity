img=imread('input\ps1-input1.png');
img=rgb2gray(img);


%%Create Gaussian Filter
hsize=31;
sigma=5;
h=fspecial('gaussian',hsize,sigma);
smooth=imfilter(img,h);
imwrite(smooth,'output\ps1-4-a-1.png');%Saving smooth image


%%Creating edge image}
/**/
img_edges_smooth=edge(smooth,'canny');
imwrite(img_edges_smooth,'output\ps1-4-b-1.png');

%%Hough accm array
[H,theta,rho]=hough_lines_acc(img_edges_smooth);
peaks=houghpeaks(H,100,'Threshold',(0.2*max(H(:))));
figure,imagesc(H,'xData',theta,'yData',rho),title('Hough Accumulator');hold on;
plot(theta(peaks(:,2)),rho(peaks(:,1)),'rs');
saveas(gcf,'output\ps1-4-c-1.png');

hough_lines_draw(img,'output\ps1-4-c-2.png',peaks,rho,theta);
