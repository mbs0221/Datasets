function [ Xr, Yr ] = MO2MT( X, Y )
%MO2MT �˴���ʾ�йش˺�����ժҪ
% Multi-Output 2 Multi-Task
%   �˴���ʾ��ϸ˵��

    [m, n] = size(Y);
    Xr = repmat(X, n, 1);
    Xr = mat2cell(Xr, ones(n, 1)*m);
    Yr = mat2cell(Y, m, ones(n, 1))';
end