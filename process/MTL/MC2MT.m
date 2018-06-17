function [ Xr, Yr ] = MC2MT( X, Y, opts )
%MC2MT �˴���ʾ�йش˺�����ժҪ
% Multi-Class 2 Multi-Task
%   �˴���ʾ��ϸ˵��

    nclass = opts.nclass;
    labels = opts.labels;
    count = opts.count;
    switch opts.mode
        case 'OvO'
            [Xr, Yr] = MTL_OvO(X, Y, nclass, labels, count);
        case 'OvR'
            [Xr, Yr] = MTL_OvR(X, Y, nclass, labels, count);
        otherwise
            [Xr, Yr] = MTL_OvO(X, Y, nclass, labels, count);
    end

    
    function [ Xr, Yr ] = MTL_OvO(X, Y, nclass, labels, count)
        m = nchoosek(nclass, 2);
        Xr = cell(m, 1);
        Yr = cell(m, 1);
        k = 0;
        for i = 1 : nclass - 1
            for j = i + 1 : nclass
                k = k + 1;
                [ Ip, In ] = OvO(Y, labels, i, j);
                [ Ip, In ] = Reduce(Ip, In, count);
                [ Xr{k, 1}, Yr{k, 1} ] = Select(X, Ip, In);
            end
        end
    end

    function [ Xr, Yr ] = MTL_OvR(X, Y, nclass, labels, count)
        Xr = cell(nclass, 1);
        Yr = cell(nclass, 1);
        for k = 1 : nclass
            [ Ip, In ] = OvR(Y, labels, k);
            [ Ip, In ] = Reduce(Ip, In, count);
            [ Xr{k, 1}, Yr{k, 1} ] = Select(X, Ip, In);
        end
    end

%% One vs One
    function [ Ip, In ] = OvO( Y, lables, i, j )
        %OvO �˴���ʾ�йش˺�����ժҪ
        % i��Ϊ����㣬j�����
        %   �˴���ʾ��ϸ˵��

        Ip = find(Y==lables(i));
        In = find(Y==lables(j));
        
    end

%% One vs Rest
    function [ Ip, In ] = OvR( Y, lables, i)
    %OvO �˴���ʾ�йش˺�����ժҪ
    % i��Ϊ����㣬���ฺ���
    %   �˴���ʾ��ϸ˵��
        
        % һ����
        Ip = find(Y==lables(i));
        In = find(Y~=lables(i));
        
    end

%% Subsampling
    function [ Ip, In ] = Reduce(Ip, In, count)
    % Ƿ����������count������
        Np = size(Ip, 1);
        Nn = size(In, 1);
        if count > 0
            Ip(randperm(Np, Np-count),:) = [];
            In(randperm(Nn, Nn-count),:) = [];
        else
            fprintf('No reduce of data.\n');
        end
    end

%% Select data
    function [ Xr, Yr ] = Select(X, Ip, In)
    % ������ǩ
        
        Xp = X(Ip, :);
        Yp = ones(size(Xp, 1), 1);
        Xn = X(In, :);
        Yn = -ones(size(Xn, 1), 1);
        Xr = [Xp; Xn];
        Yr = [Yp; Yn];
    end

end