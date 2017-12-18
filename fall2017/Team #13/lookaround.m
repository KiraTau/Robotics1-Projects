%duck=RobotRaconteur.Connect('tcp://10.13.215.107:1234/DuckiebotServer.steingate/Duckiebot');
n=921600; h = 640;w = 480;
%this is timing
duck.openCamera();
pause(1)
I1=duck.getImage();
C =zeros(480,640,3,'uint8');
C(:,:,3)=reshape(I1.data(1:3:n),h,w)';
C(:,:,2)=reshape(I1.data(2:3:n),h,w)';
C(:,:,1)=reshape(I1.data(3:3:n),h,w)';
%figure(1);
imwrite(C,'1.jpg')
movefile('1.jpg','C:/Users/Tao/OneDrive/School/Robotics/project/pic');
%image(C);
%colorbar
for i = 2:12
    duck.sendCmd(0,-3);%rotate about itself
    pause(0.5)
    duck.sendCmd(0,0);
    pause(1)
    Ii=duck.getImage();
    C(:,:,3)=reshape(Ii.data(1:3:n),h,w)';
    C(:,:,2)=reshape(Ii.data(2:3:n),h,w)';
    C(:,:,1)=reshape(Ii.data(3:3:n),h,w)';
    %figure(i);
    chr = int2str(i);
    string=[chr,'.jpg'];
    imwrite(C,string);
    movefile(string,'C:/Users/Tao/OneDrive/School/Robotics/project/pic');
    %image(C);
    %colorbar
end
duck.closeCamera();
run('undistorted.m');