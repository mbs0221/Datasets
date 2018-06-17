function [ cout, count ] = cellcat(cin, dim)
%CELLCAT �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    n = size(cin, 1);
    cout = [ ];
    count = zeros(n, 1);
    for i = 1 : n
        cout = cat(dim, cout, cin{i});
        count(i,1) = size(cin{i}, dim);
    end
end
