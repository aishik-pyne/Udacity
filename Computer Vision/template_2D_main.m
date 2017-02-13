% Test code:
tablet = rgb2gray(imread('nature.png'));
%figure,imshow(tablet);
glyph = tablet(275:325, 275:325,:);
%figure,imshow(glyph);

[y, x] = find_template_2D(glyph, tablet);
disp([y x]); % should be the top-left corner of template in tablet
