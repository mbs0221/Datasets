function [ X, Y, C ] = bovw( T, opts )
%BOVW �˴���ʾ�йش˺�����ժҪ
% Bag of Visual Word
%   �˴���ʾ��ϸ˵��
% ������
%       T    ���ݼ�
%    opts    ����

% ������Ŀ
    k = opts.k;
    
% ��������
    [C1, C2] = cellcat(T, 1);
    [D1, D2] = cellcat(C1, 2);
% ԭʼ���ݼ�
    D = zscore(single(D1'));
% ����
    tic;
    [IDX, C] = kmeans(D, k);
    t = toc;
    fprintf('����ʱ�䣺%.2f\n', t);
% ����X��Y
    [ X ] = buildX(IDX, D2, k);
    [ Y ] = buildY(C2);
    [ X ] = sparse(X);
    
    function [ X ] = buildX(IDX, count, k)
        n = size(count, 1);
        X = zeros(n, k);
        u = 1;
        for i = 1 : n
            % ��i��u,v
            v = u + count(i) - 1;
            [ idx, feat ] = bow(IDX(u:v,:));
            X(i,idx) = feat;
            % ��һ��
            u = u + count(i);
        end
    end

    function [ Y ] = buildY(count)
        n = size(count, 1);
        Y = zeros(sum(count), 1);
        u = 1;
        for i = 1 : n
            % ��i��u,v
            v = u + count(i) - 1;
            Y(u:v, 1) = i;
            u = u + count(i);
        end
    end

    function [ idx, feat ] = bow(IDX)
        tab = tabulate(IDX);
        cnt = tab(:,2)>0;
        idx = tab(cnt,1);
        feat = tab(cnt,3);
    end

end