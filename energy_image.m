% Function to compute energy image using gradient magnitude
% Inputs:
%   im: nrows-by-ncols-by-3 matrix of class uint8
%   Ix_kernel: kernel for computing x-gradient
%   Iy_kernel: kernel for computing y-gradient
% Outputs:
%   energyImage: 2D matrix (nrows-by-ncols) of class double
%   Ix: x-gradient (dI/dx)
%   Iy: y-gradient (dI/dy)

function [energyImage, Ix, Iy] = energy_image(im, Ix_kernel, Iy_kernel)
    % Convert to grayscale
    I = rgb2gray(im);
    
    % Convert to double to handle negative values
    I = double(I);
    
    % Compute gradients using imfilter
    Ix = imfilter(I, Ix_kernel);
    Iy = imfilter(I, Iy_kernel);
    
    % Compute energy using L2 norm: sqrt((dI/dx)^2 + (dI/dy)^2)
    energyImage = sqrt(Ix.^2 + Iy.^2);
end

