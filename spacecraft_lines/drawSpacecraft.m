function drawSpacecraft(uu,pts)

    % process inputs to function
    pn       = uu(1);       % inertial North position     
    pe       = uu(2);       % inertial East position
    pd       = uu(3);       % inertial Down position
    u        = uu(4);       % body frame velocities
    v        = uu(5);       
    w        = uu(6);       
    phi      = uu(7);       % roll angle         
    theta    = uu(8);       % pitch angle     
    psi      = uu(9);       % yaw angle     
    p        = uu(10);      % roll rate
    q        = uu(11);      % pitch rate     
    r        = uu(12);      % yaw rate    
    t        = uu(13);      % time

    % define persistent variables 
    persistent spacecraft_handle;
    
    % first time function is called, initialize plot and persistent vars
    if t<=0.1,
        figure(1), clf
        spacecraft_handle = drawSpacecraftBody(pts,pn,pe,pd,phi,theta,psi, [], 'normal');
        title('Spacecraft')
        xlabel('East')
        ylabel('North')
        zlabel('-Down')
        view(32,47)  % set the vieew angle for figure
        axis([-10,10,-10,10,-10,10]);
        hold on
        
    % at every other time step, redraw base and rod
    else 
        drawSpacecraftBody(pts,pn,pe,pd,phi,theta,psi, spacecraft_handle);
    end
end

  
%=======================================================================
% drawSpacecraftBody
% return handle if 7th argument is empty, otherwise use 7th arg as handle
%=======================================================================
%
function handle = drawSpacecraftBody(NED,pn,pe,pd,phi,theta,psi, handle, mode)
  
  NED = rotate(NED,phi,theta,psi); % rotate spacecraft by phi, theta, psi
  NED = translate(NED,pn,pe,pd); % translate spacecraft
  % transform vertices from NED to XYZ (for matlab rendering)
   R = [...
       0, 1, 0;...
       1, 0, 0;...
       0, 0, -1;...
       ];
   XYZ = R*NED;
  
  % plot spacecraft
  if isempty(handle),
    handle = plot3(XYZ(1,:),XYZ(2,:),XYZ(3,:),'EraseMode', mode);
  else
    set(handle,'XData',XYZ(1,:),'YData',XYZ(2,:),'ZData',XYZ(3,:));
    drawnow
  end
end
 

%%%%%%%%%%%%%%%%%%%%%%%
function XYZ=rotate(XYZ,phi,theta,psi);
  % define rotation matrix
  R_roll = [...
          1, 0, 0;...
          0, cos(phi), -sin(phi);...
          0, sin(phi), cos(phi)];
  R_pitch = [...
          cos(theta), 0, sin(theta);...
          0, 1, 0;...
          -sin(theta), 0, cos(theta)];
  R_yaw = [...
          cos(psi), -sin(psi), 0;...
          sin(psi), cos(psi), 0;...
          0, 0, 1];
  R = R_yaw*R_pitch*R_roll;

  % rotate vertices
  XYZ = R*XYZ;
  
end
% end rotateVert

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% translate vertices by pn, pe, pd
function XYZ = translate(XYZ,pn,pe,pd)

  XYZ = XYZ + repmat([pn;pe;pd],1,size(XYZ,2));
  
end

% end translateXYZ

  