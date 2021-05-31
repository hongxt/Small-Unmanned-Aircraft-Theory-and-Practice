clc
clear
close all

pts = [...
 1 1 0;... % point 1
 1 -1 0;... % point 2
 -1 -1 0;... % point 3
 -1 1 0;... % point 4
 1 1 0;... % point 1
 1 1 -2;... % point 5
 1 -1 -2;... % point 6
 1 -1 0;... % point 2
 1 -1 -2;... % point 6
 -1 -1 -2;... % point 7
 -1 -1 0;... % point 3
 -1 -1 -2;... % point 7
 -1 1 -2;... % point 8
-1 1 0;... % point 4
-1 1 -2;... % point 8
 1 1 -2;... % point 5
 1 1 0;... % point 1
 1.5 1.5 0;... % point 9
 1.5 -1.5 0;... % point 10
 1 -1 0;... % point 2
 1.5 -1.5 0;... % point 10
 -1.5 -1.5 0;... % point 11
 -1 -1 0;... % point 3
 -1.5 -1.5 0;... % point 11
 -1.5 1.5 0;... % point 12
 -1 1 0;... % point 4
 -1.5 1.5 0;... % point 12
 1.5 1.5 0;... % point 9
 ]';

fuse_len1=1;
fuse_len2=0.7;
fuse_len3=3;
fuse_w=0.7;
fuse_h=0.7;

wing_len=1.2;
wing_w=4;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
tailwing_len=1;
tailwing_w=1.5;
tail_h=1;


pts_2=[...
    %质心
    0,0,0;% point 0
    
    %机体
    fuse_len1,0,0;% point 1
    fuse_len2,fuse_w/2,fuse_h/2;% point 2
     fuse_len2,-fuse_w/2,fuse_h/2;% point 3
     fuse_len2,-fuse_w/2,-fuse_h/2;% point 4
     fuse_len2,fuse_w/2,-fuse_h/2;% point 5
     -fuse_len3,0,0;% point 6
     
     %机翼
     0,wing_w/2,0;% point 7
     -wing_len,wing_w/2,0;% point 8
     -wing_len,-wing_w/2,0;% point 9
     0,-wing_w/2,0;% point 10
     
     %水平尾翼
     -(fuse_len3-tailwing_len),tailwing_w/2,0;% point 11
     -fuse_len3,tailwing_w/2,0;% point 12
     -fuse_len3,-tailwing_w/2,0;% point 13
     -(fuse_len3-tailwing_len),-tailwing_w/2,0;% point 14
     
     %垂直尾翼
     -(fuse_len3-tailwing_len),0,0;% point 15
      -fuse_len3,0,tail_h;% point 16
     
    ]';
pt_inedx=[1,2,3,1,...
    1,3,4,1,...
    1,4,5,1,...
    1,5,2,1,...
    1,2,6,3,2,...
    2,6,5,2,...
    2,5,4,6,5,...
    5,4,6,3,4,...
    4,6,0,7,8,9,10,0,...
    0,6,12,11,14,13,...
    6,16,15,6];

plane_pts=[];
pts_num=size(pt_inedx,2);

for i=1:pts_num
    plane_pts(i,1)=pts_2(1,pt_inedx(1,i)+1);
    plane_pts(i,2)=pts_2(2,pt_inedx(1,i)+1);
    plane_pts(i,3)=pts_2(3,pt_inedx(1,i)+1);
end
plane_pts=plane_pts';

for t=0:0.1:1000
    uu1=[-1,2,-1,0,0,0,...
    0,-0.01*t,0,0,0,0,t];
    drawSpacecraft(uu1,plane_pts);
end