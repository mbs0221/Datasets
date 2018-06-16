function [ image ] = load_image(file, annotaion, mode, show)
%LOAD_IMAGE 此处显示有关此函数的摘要
%   此处显示详细说明

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