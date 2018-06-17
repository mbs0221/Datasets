function [  ] = plot_sift( f, d )
%PLOT_SIFT �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

    perm = randperm(size(f,2)) ;
    sel = perm(1:50) ;
    h1 = vl_plotframe(f(:,:)) ;
    h2 = vl_plotframe(f(:,:)) ;
    set(h1,'color','k','linewidth',3) ;
    set(h2,'color','y','linewidth',2) ;
    hold on;
    h3 = vl_plotsiftdescriptor(d(:,sel),f(:,sel)) ;
    set(h3,'color','g') ;
    
end

