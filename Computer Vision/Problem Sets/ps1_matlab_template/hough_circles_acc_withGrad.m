function H = hough_circles_acc_withGrad(BW, img, radius)
    % Compute Hough accumulator array for finding circles.
    %
    % BW: Binary (black and white) image containing edge pixels
    % radius: Radius of circles to look for, in pixels

    % TODO: Your code here
    H=zeros(uint32(size(BW)),'double');
    [FX,FY]=gradient(double(img));
    for i=1:size(BW,1)
        for j=1:size(BW,2)
            if(BW(i,j)==1)
                x=1:size(H,1);
                y= min(  max(uint64(j+(FX(i,j)/FY(i,j))*(x-i)) ,1),size(H,2));
                H(x,y)=H(x,y)+1;
            end
        end
    end
    imshow(H,[]);
end
