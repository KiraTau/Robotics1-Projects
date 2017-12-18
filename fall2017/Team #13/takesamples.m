%duck=RobotRaconteur.Connect('tcp://10.13.215.107:1234/DuckiebotServer.steingate/Duckiebot');
n=921600; h = 640;w = 480;
duck.openCamera();
pause(1);
I1=duck.getImage();
C =zeros(480,640,3,'uint8');
C(:,:,3)=reshape(I1.data(1:3:n),h,w)';
C(:,:,2)=reshape(I1.data(2:3:n),h,w)';
C(:,:,1)=reshape(I1.data(3:3:n),h,w)';
imwrite(C,'1.jpg')
movefile('1.jpg','C:/Users/Tao/OneDrive/School/Robotics/project/tfcali');
figure();
image(C);
colorbar
duck.sendCmd(0,-3);
pause(0.5)
duck.sendCmd(0,0);
pause(1)
I1=duck.getImage();
C =zeros(480,640,3,'uint8');
C(:,:,3)=reshape(I1.data(1:3:n),h,w)';
C(:,:,2)=reshape(I1.data(2:3:n),h,w)';
C(:,:,1)=reshape(I1.data(3:3:n),h,w)';
imwrite(C,'2.jpg')
movefile('2.jpg','C:/Users/Tao/OneDrive/School/Robotics/project/tfcali');
figure();
image(C);
duck.closeCamera();
duck.sendCmd(0,3);%rotate about itself
pause(0.5)
duck.sendCmd(0,0);
run('get_tf.m');