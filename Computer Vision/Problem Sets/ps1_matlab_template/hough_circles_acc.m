function H = hough_circles_acc(BW, radius)
    % Compute Hough accumulator array for finding circles.
    %
    % BW: Binary (black and white) image containing edge pixels
    % radius: Radius of circles to look for, in pixels

    % TODO: Your code here
    H=zeros(uint32(size(BW)),'double');
    for i=1:size(BW,1)
        for j=1:size(BW,2)
            if(BW(i,j)==1)
                for x=max(1,j-radius):min(size(H,2),j+radius)
                    y1=uint64( sqrt(radius^2 - (x-j)^2) + i);
                    y2=uint64(-sqrt(radius^2 - (x-j)^2) + i);
                    if(y1>=1 && y1<+size(H,1))
                        H(y1,x)=H(y1,x)+1;
                    end
                    if(y2>=1 && y1<+size(H,1))
                        H(y2,x)=H(y2,x)+1;
                    end
                end
            end
        end
    end
    imshow(H,[]);
end
