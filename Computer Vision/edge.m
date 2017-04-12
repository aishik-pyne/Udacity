function edge(cam)
   preview(cam);
   while(1)
      img = snapshot(cam);imshow(img);
      img=rgb2gray(img);imshow(img);
      BW1 = edge(I,'Canny');
      imshow(BW1);
   end
end