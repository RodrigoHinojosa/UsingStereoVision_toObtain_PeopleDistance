# StereoVision_HumanDistance

## Software considerations

1.-Matlab 2015 to 2022a version is need it (doesn't have support in new versions to the moment).

2.-Image processing and computer vision toolbox must be implemented in matlab

3.-Stereo camera calibrator app

4.-Hig computacional capabilities

## Checkerboard

Matlab needs a reference to sizing the space and obtain the stereo params, for that reason, to this proyect we need print a checkerboard with specific diensions, for this example the checkerboard was sizing  with next size:

#### `Pattern size (The checkerboard must be symmetric in Y, but asymmetric in X):` 

-width (X): 9

-Height (Y): 6

#### `Checker size (you can chose yor own dimensions):` 

-width: 2.5

-Height: 2.5

In this repository  you can find one app to create a checkerboard  with different dimensions, you just need download the `Chessboardmaker.zip` file, uncompress and ejecute the `Checkerboardmaker app`.

## Files to ejecute snapshots, calibration and video processing

Step 1.- Use SnapShotStereo_Camera to generate two files with n number of L & R images.

Step 2.- Go to matlab/apps/Setero camera calibrator or Camera calibrator if you just use one camera/add images/ execute the calibration/ save the package witha a stereo param or just params

![image](https://user-images.githubusercontent.com/78772019/220697756-2ff77f05-7b45-4630-97e3-436b8db53388.png)
![image](https://user-images.githubusercontent.com/78772019/220698161-61fabb4b-d3a2-4ca0-b5b0-9d7ab3c53d6f.png)

![OptionsOk](https://github.com/RodrigoHinojosa/UsingStereoVision_toObtain_PeopleDistance/assets/78772019/41fb4cea-d09a-4072-9973-89668c5cbd75)




Step 3.- Open video_test_winds_new/ modify the script with the correct intrinsic and extrinsic characteristics to your camera and number of frames to be recorded/run the script to record the videos L & R

Step 4.- Open VideoStereo_Camera/load the package with the stereo params/ load the videos L & R/ Run the scrip/ at this time your pc will need a good processing capacity

For more information:

https://la.mathworks.com/videos/camera-calibration-with-matlab-81233.html

https://la.mathworks.com/help/vision/ug/using-the-stereo-camera-calibrator-app.html?searchHighlight=Stereo\%20Calibration\%20app\%2C&s_tid=srchtitle_Stereo\%20Calibration\%20app\%252C_2
