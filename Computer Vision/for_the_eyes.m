frizzy = double(rgb2gray(imread('frizzy.png')))/255.0;
froomer =double(rgb2gray(imread('froomer.png')))/255.0;
imshow(frizzy);
imshow(froomer);

% TODO: Find edges in frizzy and froomer images
friz_edge=edge(frizzy,'Canny');
froo_edge=edge(froomer,'Canny');
figure,imshowpair(friz_edge,froo_edge,'Montage');

common=friz_edge & froo_edge;
%{
common=zeros(size(frizzy),'double');
for idx = 1:numel(common)
    if(friz_edge(idx)==1 && froo_edge(idx)==1)
        common(idx)=1;
    end    
end
%}
figure,imshow(common);
% TODO: Display common edge pixels