% Find template 1D
% NOTE: Function definition must be the very first piece of code here!
% Test code:
s = [-1 0 0 1 1 1 0 -1 -1 0 1 0 0 -1];
t = [1 1 0];
disp('Signal:'), disp([1:size(s, 2); s]);
disp('Template:'), disp([1:size(t, 2); t]);
index = find_template_1D(t, s);
disp('Index:'), disp(index);