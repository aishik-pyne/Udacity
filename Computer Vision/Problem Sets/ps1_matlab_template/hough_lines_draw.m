function hough_lines_draw(img, outfile, peaks, rho, theta)
    % Draw lines found in an image using Hough transform.
    %
    % img: Image on top of which to draw lines
    % outfile: Output image filename to save plot as
    % peaks: Qx2 matrix containing row, column indices of the Q peaks found in accumulator
    % rho: Vector of rho values, in pixels
    % theta: Vector of theta values, in degrees

    % TODO: Your code here
    figure,imshow(img),hold on;
    for k=1:length(peaks)
       t=theta(peaks(k,2));
       rad=pi/180*t;
       r=rho(peaks(k,1));
       x=1:size(img,2);
       y=1:size(img,1);
       if(t~=0)
          y=(r-x.*cos(rad))./sin(rad);
       else
          x=(r-y.*sin(rad))./cos(rad);
       end
       plot(x,y,'LineWidth',2,'color','green');
    end
    hold off;
    saveas(gcf,outfile);
end
