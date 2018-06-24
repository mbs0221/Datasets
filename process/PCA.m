function [ Y ] = PCA( X, percent )
%PCA �˴���ʾ�йش˺�����ժҪ
% ��ά
%   �˴���ʾ��ϸ˵��
    [~,SCORE,LATENT] = pca(X);
    S = cumsum(LATENT)./sum(LATENT);
    index = find(S>percent);
    Y = SCORE(:,1:index(1));
end

