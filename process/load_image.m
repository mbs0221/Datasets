function [ image ] = load_image(file, annotaion, mode, show)
%LOAD_IMAGE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

    image = imread(file);
    
    if nargin > 2
        bbox = load_bbox(annotaion, mode);
        image = imcrop(image, bbox);
    end
    
    if nargin > 3
        if show == true
            imshow(image);
        end
    end
end