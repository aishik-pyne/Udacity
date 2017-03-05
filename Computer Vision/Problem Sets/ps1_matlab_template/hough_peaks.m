function peaks = hough_peaks(H, varargin)
    % Find peaks in a Hough accumulator array.
    %
    % Threshold (optional): Threshold at which values of H are considered to be peaks
    % NHoodSize (optional): Size of the suppression neighborhood, [M N]
    %
    % Please see the Matlab documentation for houghpeaks():
    % http://www.mathworks.com/help/images/ref/houghpeaks.html
    % Your code should imitate the matlab implementation.

    % Parse input arguments
    p = inputParser;
    addOptional(p, 'numpeaks', 1, @isnumeric);
    addParameter(p, 'Threshold', 0.5 * max(H(:)));
    addParameter(p, 'NHoodSize', floor(size(H) / 100.0) * 2 + 1);  % odd values >= size(H)/50
    parse(p, varargin{:});

    numpeaks = p.Results.numpeaks;
    threshold = p.Results.Threshold;
    nHoodSize = p.Results.NHoodSize;

    % TODO: Your code here
    peaks=zeros(int32(numpeaks),3);
    %HP=padarray(H,nHoodSize);
    pc=1;
    for i=1:size(H,1)
        for j=1:size(H,2)
            if(isPeak(H,i,j,nHoodSize,threshold))
                peaks(pc,1)=i;
                peaks(pc,2)=j;
                peaks(pc,3)=H(i,j);
                pc=pc+1;
            end
        end
    end
    peaks=sortrows(peaks,-3);
    peaks=peaks(1:min(numpeaks,(pc-1)),1:2);
    
end

function out=isPeak(H,i,j,nHoodSize,threshold)
    nhh=uint32(floor(nHoodSize(1)));
    nhv=uint32(floor(nHoodSize(2)));
    out=true;
    if(H(i,j)<threshold)
        out=false;
        return
    end
    for x=max(1,(i-nhv)):min(size(H,1),(i+nhv))
        for y=max(1,(j-nhh)):min(size(H,2),(j+nhh))
            if(i~=x && j~=y)
                if(H(i,j)<=H(x,y))
                   out=false;
                   return;
                end
            end
        end
    end
end