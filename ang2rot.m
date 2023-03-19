function R = ang2rot(alpha, beta, gamma)
alpha = alpha*pi/180;
beta = beta*pi/180;
gamma = gamma*pi/180;

    Rz = [cos(alpha) -sin(alpha) 0;
            sin(alpha) cos(alpha) 0;
                 0 0 1];
    Ry = [cos(beta) 0 sin(beta);
                   0 1 0;
            -sin(beta) 0 cos(beta)];
    Rx =   [    1 0 0;
            0 cos(gamma) -sin(gamma);
            0 sin(gamma) cos(gamma)];
        
    R = Rz * Ry * Rx;
end
