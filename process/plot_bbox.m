function [  ] = plot_bbox( box )
%PLOT_BBOX �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

    rectangle('position', [box(1), box(2), box(3)-box(1), box(4)-box(2)]);
end