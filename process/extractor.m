function [ f, d, hog ] = extractor( I, mode )

    switch mode
        case 'HOG'
            cellSize = 8;
            hog = vl_hog(I, cellSize, 'verbose');
        case 'SIFT'
            I = single(rgb2gray(I));
            [f, d] = vl_sift(I, 'PeakThresh', 5, 'EdgeThresh', 5);
        case 'Dense SIFT'
            I = single(vl_imdown(rgb2gray(I))) ;
            binSize = 8;
            magnif = 3;
            Is = vl_imsmooth(I, sqrt((binSize/magnif)^2 - .25));
            [f, d] = vl_dsift(Is, 'Step', 8, 'Size', binSize);
        otherwise
            throw(MException('extractor', ['unknown mode:', mode]));
    end
end