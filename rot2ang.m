function [angles1,angles2] = rot2ang(R)

beta1 = atan2(-R(3,1),sqrt(R(3,2)^2+R(3,3)^2));
beta2 = atan2(-R(3,1),-sqrt(R(3,2)^2+R(3,3)^2));

alpha1 = atan2(R(2,1)/cos(beta1),R(1,1)/cos(beta1));
alpha2 = atan2(R(2,1)/cos(beta2),R(1,1)/cos(beta2));

gamma1 = atan2(R(3,2)/cos(beta1),R(3,3)/cos(beta1));
gamma2 = atan2(R(3,2)/cos(beta2),R(3,3)/cos(beta2));

angles1 = [180*alpha1/pi,180*beta1/pi,180*gamma1/pi];
angles2 = [180*alpha2/pi,180*beta2/pi,180*gamma2/pi];

end


