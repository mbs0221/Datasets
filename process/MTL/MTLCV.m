function [ INDICES ] = MTLCV( X, k )
%MTLCV �˴���ʾ�йش˺�����ժҪ
% �����񽻲���֤����
%   �˴���ʾ��ϸ˵��

    TaskNum = size(X, 1);
    INDICES = cell(TaskNum, 1);
    for i =  1 : TaskNum
        m = size(X{i}, 1);
        INDICES{i} = CrossValInd(m, k);
    end
end

