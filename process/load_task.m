function [ images, discr, count ] = load_task(image_path, bbox_path, bbox)
%LOAD_TASK �˴���ʾ�йش˺�����ժҪ
% ��������
%   �˴���ʾ��ϸ˵��

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
        discr = []; % Dense SIFT������
        count = []; % Dense SIFT����ͳ��
        for i = 1 : num
            [~, d] = extractor(images{i, 1}, 'Dense SIFT');
            discr = cat(2, discr, d);
            count = cat(1, count, n);
        end
    end
end