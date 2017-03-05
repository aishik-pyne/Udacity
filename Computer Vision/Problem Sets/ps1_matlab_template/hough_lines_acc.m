function [H, theta, rho] = hough_lines_acc(BW, varargin)
    % Compute Hough accumulator array for finding lines.
    %
    % BW: Binary (black and white) image containing edge pixels
    % RhoResolution (optional): Difference between successive rho values, in pixels
    % Theta (optional): Vector of theta values to use, in degrees
    %
    % Please see the Matlab documentation for hough():
    % http://www.mathworks.com/help/images/ref/hough.html
    % Your code should imitate the Matlab implementation.
    %
    % Pay close attention to the coordinate system specified in the assignment.
    % Note: Rows of H should correspond to values of rho, columns those of theta.

    % Parse input arguments
    p = inputParser();
    addParameter(p, 'RhoResolution', 1);
    addParameter(p, 'Theta', linspace(-90, 89, 180));
    parse(p, varargin{:});

    rhoStep = p.Results.RhoResolution;
    theta = p.Results.Theta;

    % TODO: Your code here
    D=int32(ceil(sqrt((size(BW,1)-1)^2 +(size(BW,2)-1)^2)));%Diagonal length
    thetaR=180;
    rhoR=2*D+1;
    H=zeros(rhoR,thetaR);
    rho=double(-D:D);
    for i=1:size(BW,1)
        for j=1:size(BW,2)
            if(BW(i,j)==1)            
                for t=1:thetaR
                    rad=pi/180*(t-91);                  
                    r=int32(round(j*cos(rad) + i*sin(rad)));
                    H(r+(D+1),t)=H(r+(D+1),t)+1;
                end
            end       
        end
    end
end
