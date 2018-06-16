function [ images, discr, count ] = load_task(image_path, bbox_path, bbox)
%LOAD_TASK 此处显示有关此函数的摘要
% 加载任务
%   此处显示详细说明

    image_files = string(ls(image_path));
    bbox_files  = string(ls(bbox_path));

    m = size(image_files, 1);
    n = size(bbox_files,1);

    num = min([m, n]);
    images = cell(num, 1);
    for i = 1 : num
        images{i, 1} = load_image(image_files(i), bbox_files(i), '101', true);
    end
    
    if bbox == true
        discr = []; % Dense SIFT描述符
        count = []; % Dense SIFT特征统计
        for i = 1 : num
            [~, d] = extractor(images{i, 1}, 'Dense SIFT');
            discr = cat(2, discr, d);
            count = cat(1, count, n);
        end
    end
end