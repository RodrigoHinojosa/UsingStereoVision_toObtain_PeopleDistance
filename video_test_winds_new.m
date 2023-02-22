%% Program Edited by Juan Manuel Jacinto Villegas, Date: 13-07-2016; Version 1
% email: j.jacinto@sssup.it
% This script allows to create two independent videos from two cameras (Stero cameras) into
% an .AVI file format 

%%
clear
clc
close all
%delete(vid)
%clear vid

%% Cameras parameters
disp('---------------- Cameras Parameters ----------------')
webcamlist
info1=imaqhwinfo('winvideo',3)
info1.SupportedFormats



info2=imaqhwinfo('winvideo',1)
info2.SupportedFormats


%%
disp('---------------- Creating Cameras Objects ----------------')
imaqmex('feature','-limitPhysicalMemoryUsage',false);
left_cam1 = videoinput('winvideo',3, 'MJPG_1280x720');

imaqhwinfo(left_cam1)
right_cam2 = videoinput('winvideo',1, 'MJPG_1280x720');
imaqhwinfo(right_cam2)
% f= getframe(left_cam1)
% close (left_cam1)
%%
%  L_cam1=getsnapshot(left_cam1);
%   imshow(L_cam1);
  %%
  
%  R_cam2=getsnapshot(right_cam2);
%   imshow(R_cam2);

%%
% vid = videoinput('winvideo',1);
%     frameRates = set(getselectedsource(vid), 'FrameRate')
%     vid.FramesPerTrigger = 30;
%     start(vid); [frames, timeStamp] = getdata(vid);
%      frameRateCalc = 1/mean(diff(timeStamp))


set(left_cam1, 'FramesPerTrigger', Inf);
%frameRates1 = set(getselectedsource(left_cam1), 'FrameRate')
vid.FrameRate =25;
set(left_cam1, 'ReturnedColorspace', 'rgb');

set(right_cam2, 'FramesPerTrigger', Inf);
%frameRates2 = set(getselectedsource(right_cam2), 'FrameRate')
vid.FrameRate =25;
set(right_cam2, 'ReturnedColorspace', 'rgb');

left_cam1.FramesAvailable
left_cam1.FramesAcquired

right_cam2.FramesAvailable
right_cam2.FramesAcquired

%imaqmem
%mem = imaqmem(100000000000);
%imaqmem(field)
%imaqmem(limit)
%imaqmem('FrameMemoryUsed');

%memlimit = imaqmem('FrameMemoryLimit')

%%
disp('---------------- Starting Cameras ----------------')

% Camera 1
flushdata(left_cam1);
left_cam1.FramesAvailable
left_cam1.FrameGrabInterval = 3;  % distance between captured frames 
triggerconfig(left_cam1, 'manual');%%
start(left_cam1)

% Camera 2
flushdata(right_cam2);
right_cam2.FramesAvailable
right_cam2.FrameGrabInterval = 3;  % distance between captured frames 
triggerconfig(right_cam2, 'manual');%%
start(right_cam2)

%%
pause(3)
disp('---------------- Recording Video1 ----------------')

Obj_cam1_L = VideoWriter('D:\UAEM\MCI\Primer semestre\Programación\StereoVision\Videos\Cam1_Left\Cam_1_LEFT_2.avi');
open(Obj_cam1_L);

Obj_cam2_R = VideoWriter('D:\UAEM\MCI\Primer semestre\Programación\StereoVision\Videos\Cam2_Right\Cam_2_RIGHT_2.avi');
open(Obj_cam2_R);

%%
% create cell arrays for the images from the two cameras


 n=200 %number of frames to record
 tic
for k = 1:n 
%  
   subplot(1,2,1);
  L_cam1=getsnapshot(left_cam1);
   imshow(L_cam1);
%   
  subplot(1,2,2);
  R_cam2=getsnapshot(right_cam2);
  imshow(R_cam2);
  
  F_cam1 = im2frame(L_cam1);
  F_cam2 = im2frame(R_cam2);
  
   %frame = getframe;
   writeVideo(Obj_cam1_L,F_cam1);
   writeVideo(Obj_cam2_R,F_cam2);
   
end
elapsedTime = toc
timePerFrame = elapsedTime/20
effectiveFrameRate = 1/timePerFrame

pause(3)
disp('---------------- Video was recorded succesfully ----------------')
close(Obj_cam1_L);
close(Obj_cam2_R);


stop(left_cam1);
delete(left_cam1)
clear vid1

stop(right_cam2);
delete(right_cam2)
clear vid2

close all