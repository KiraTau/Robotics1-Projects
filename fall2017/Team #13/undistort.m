%%
% load the camera parameters.
load('cam.mat');
%%
% Remove lens distortion and display results.
images = imageDatastore(fullfile('C:/Users/Tao/OneDrive/School/Robotics/project/pic'));
for i = 1:1
    I = images.readimage(i);
    Ji = undistortImage(I,cameraParams);
    Ki = undistortImage(I,cameraParams,'OutputView','full');
    chr = int2str(i);
    string=[chr,'.jpg'];
    imwrite(Ji,string);
    if (i == 1)
        movefile(string,'C:/Users/Tao/OneDrive/School/Robotics/project/undistorted/set2');
    else
        movefile(string,'C:/Users/Tao/OneDrive/School/Robotics/project/undistorted/set1');
    end
    image(I);
    figure; imshowpair(I,Ki,'montage');
    title('Full Image (left) vs. Corrected Image (right)');
 end
% for i = 4:6
%     I = images.readimage(i);
%     Ji = undistortImage(I,cameraParams);
%     Ki = undistortImage(I,cameraParams,'OutputView','full');
%     chr = int2str(i);
%     string=[chr,'.jpg'];
%     imwrite(Ji,string);
%     if (i == 4)
%         movefile(string,'C:/Users/Tao/OneDrive/School/Robotics/project/undistorted/set1');
%     else
%         movefile(string,'C:/Users/Tao/OneDrive/School/Robotics/project/undistorted/set2');
%     end
%     figure; imshowpair(Ki,Ji,'montage');
%     title('Full Image (left) vs. Corrected Image (right)');
% end
% for i = 7:9
%     I = images.readimage(i);
%     Ji = undistortImage(I,cameraParams);
%     Ki = undistortImage(I,cameraParams,'OutputView','full');
%     chr = int2str(i);
%     string=[chr,'.jpg'];
%     imwrite(Ji,string);
%     movefile(string,'C:/Users/Tao/OneDrive/School/Robotics/project/undistorted/set3');
%     figure; imshowpair(Ki,Ji,'montage');
%     title('Full Image (left) vs. Corrected Image (right)');
% end
% for i = 10:12
%     I = images.readimage(i);
%     Ji = undistortImage(I,cameraParams);
%     Ki = undistortImage(I,cameraParams,'OutputView','full');
%     chr = int2str(i);
%     string=[chr,'.jpg'];
%     imwrite(Ji,string);
%     movefile(string,'C:/Users/Tao/OneDrive/School/Robotics/project/undistorted/set4');
%     figure; imshowpair(Ki,Ji,'montage');
%     title('Full Image (left) vs. Corrected Image (right)');
% end
% run('set1.m');
% run('set2.m');
% run('set3.m');
% run('set4.m');