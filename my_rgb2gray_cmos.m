function [image_out, imgGray_L] = my_rgb2gray_cmos(objectFrame_L, level_1, Disk_diam,Filt_level)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


 imgGray_L = rgb2gray(objectFrame_L);
 %Disk_diam = Disk_diam; %not used for the moment

% Convert to binary (B/W) the image, and apply filters
  B1 = im2bw(imgGray_L,level_1);    % Left Camera
  
   % B1 = imcomplement(B1);
   
   %% Applying filters and filling empty regions
    se1 = strel('ball',Disk_diam,0,8); % ellipsoid 
%    %se1 = strel('disk',Disk_diam,0); % Disk_diam = 1;
%    %se1 = strel('disk',Disk_diam); % Disk_diam = 1;
%    %se1 = strel('disk',0,4); % Disk_diam = 1;
%    %se1 = strel('arbitrary',1)
%    
%    
   B1 = imerode(B1,se1);
%    C1 = imdilate(B1_,se1);
%    
   %%
    image_out = bwareaopen(B1,Filt_level); % Filt_level = 135% 
   
%    image_out = imgGray_L;
  
  %% Shows and Compares images
%     figure;
%    subplot(1,2,1);
%     imshow(B1);
%     title('B1');
%    %figure;
%    subplot(1,2,2);
%    imshow(image_out);
%    title('Image after filter');

  
   
end

