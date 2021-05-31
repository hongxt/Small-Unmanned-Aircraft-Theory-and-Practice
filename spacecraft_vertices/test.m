clc
clear
close all
% %%画面的方法

%% %飞机的尺寸数值和顶点坐标


fuse_len1=1.5;
fuse_len2=0.7;
fuse_len3=3;
fuse_w=0.7;
fuse_h=0.7;

wing_len=1.2;
wing_w=4;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
tailwing_len=1;
tailwing_w=1.5;
tail_h=1;

%飞机的顶点坐标
pts_2=[...
%     %质心
%     0,0,0;% point 0
    
    %机体
    fuse_len1,0,-0;% point 1
    fuse_len2,fuse_w/2,-fuse_h/2;% point 2
     fuse_len2,-fuse_w/2,-fuse_h/2;% point 3
     fuse_len2,-fuse_w/2,fuse_h/2;% point 4
     fuse_len2,fuse_w/2,fuse_h/2;% point 5
     -fuse_len3,0,-0;% point 6
     
     %机翼
     0,wing_w/2,-0;% point 7
     -wing_len,wing_w/2,-0;% point 8
     -wing_len,-wing_w/2,-0;% point 9
     0,-wing_w/2,-0;% point 10
     
     %水平尾翼
     -(fuse_len3-tailwing_len),tailwing_w/2,-0;% point 11
     -fuse_len3,tailwing_w/2,-0;% point 12
     -fuse_len3,-tailwing_w/2,-0;% point 13
     -(fuse_len3-tailwing_len),-tailwing_w/2,-0;% point 14
     
     %垂直尾翼
     -(fuse_len3-tailwing_len),0,-0;% point 15
      -fuse_len3,0,-tail_h;% point 16
     
    ]';

%% vertices
V=pts_2';


%% faces
F=[...
    1,2,3,1;
    1,3,4,1;
    1,4,5,1;
    1,2,5,1;
    6,2,3,6;
    6,3,4,6;
    6,4,5,6;
    6,2,5,6;
    7,8,9,10;
    11,12,13,14;
    6,15,16,6;
    ];
%% colors
myred = [1, 0, 0];
mygreen = [0, 1, 0];
myblue = [0, 0, 1];
myyellow = [1, 1, 0];
mycyan = [0, 1, 1];

%% 面的颜色
patchcolors=[myblue;myblue;myblue;...
    myblue;mygreen;myblue;...
    myblue;myblue;myblue;...
    myblue;mygreen];

for t=0:0.1:1000
    uu1=[2,2,1,0,0,0,...
    0.01*t,0,0,0,0,0,t];
    drawSpacecraft(uu1,V,F,patchcolors);
end