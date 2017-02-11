
function index = find_template_1D(t, s)
    % TODO: Locate template t in signal s and return index
    c=normxcorr2(t,s);
    disp([1:size(c,2) ;c]);
    [maxVal,rawIndex]=max(c);
    
    index=rawIndex-size(t,2)+1;
    % NOTE: Turn off all output from inside the function before submitting!
end
