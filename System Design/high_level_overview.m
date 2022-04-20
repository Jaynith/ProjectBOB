%motor specs

nominal_v = 12;
K_v = 982;
K_t = 9.5/1000; 
R_a = (nominal_v - 11780/K_v)/0.8;
L_a = (0.005);

shaft_len = 75.01/1000; 
shaft_diam = 3.2/1000;
shaft_vol = shaft_len * pi * (shaft_diam/2)^2;
shaft_dens = 7750; 
shaft_mass = shaft_dens * shaft_vol; 

J = 0.5 * shaft_mass * (shaft_diam/2)^2;
B = 5.0e-06;

%encoder feedback filter

fs = 500000;
Ts = 1/fs;

f0 = 180;
w0 = 2*pi*f0;
zeta = 0.6;

num_sys = [w0^2, 0];
den_sys = [1, 2*w0*zeta, w0^2];
sys_c = tf(num_sys, den_sys)

sys_d = c2d(sys_c, Ts, 'tustin')