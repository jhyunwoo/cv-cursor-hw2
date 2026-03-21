% Function to repeatedly reduce the image size by removing seams
% Inputs:
%   filename: character array (e.g. 'prague.jpg')
%   reduceAmt: integer indicating how many pixels to reduce
%   reduceWhat: 'WIDTH' or 'HEIGHT'
% Outputs:
%   contentAwareResize: the content-aware reduced image

function contentAwareResize = generate_results(filename, reduceAmt, reduceWhat)
    % Read the image
    contentAwareResize = imread(filename);
    
    % Repeatedly reduce the image by calling reduceWidth or reduceHeight
    if strcmp(reduceWhat, 'WIDTH')
        for i = 1:reduceAmt
            contentAwareResize = reduceWidth(contentAwareResize, false);
            fprintf('Reducing width: %d/%d\n', i, reduceAmt);
        end
    elseif strcmp(reduceWhat, 'HEIGHT')
        for i = 1:reduceAmt
            contentAwareResize = reduceHeight(contentAwareResize, false);
            fprintf('Reducing height: %d/%d\n', i, reduceAmt);
        end
    else
        error('reduceWhat must be either ''WIDTH'' or ''HEIGHT''');
    end
end

