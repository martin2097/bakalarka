function hod = f1(x)

hod = x(1)^2 + 2*x(2)^2 + -0.3 * cos(3*pi*x(1)) -0.4 * cos(4*pi*x(2)) + 0.7; %bohachevsky %hessian nieje poz def?

%hod=(x(1) + 2*x(2) - 7)^2 + (2*x(1) + x(2) - 5)^2; %booth function %dogleg ok

%hod= 0.26 * (x(1)^2 + x(2)^2) + -0.48*x(1)*x(2); %matyas function %dogleg ok

%hod = (sin(x(1) + x(2))) + ((x(1) - x(2))^2) -(1.5*x(1)) + (2.5*x(2)) + 1;
%%McCormick Function hessian nieje poz def?

%hod = (4-2.1*x(1)^2+(x(1)^4)/3) * x(1)^2 + x(1)*x(2) + (-4+4*x(2)^2) *x(2)^2;   %Six-Hump Camel Function %pozor na poz def, funguje napr v [0.5;0.5]

%hod = 2*x(1)^2 -1.05*x(1)^4 + x(1)^6 / 6 + x(1)*x(2) + x(2)^2; %Three-Hump Camel Function ok v [0.5;0.5]

%hod = (1.5 - x(1) + x(1)*x(2))^2 + (2.25 - x(1) + x(1)*x(2)^2)^2 + (2.625 - x(1) + x(1)*x(2)^3)^2; %Beale Function % funguje pozor v x(2)=1 nieje hessian pozitivne definitny

%hod = 1 * (x(2) - (5.1/(4*pi^2))*x(1)^2 + (5/pi)*x(1) - 6)^2 + 10*(1-(1/(8*pi)))*cos(x(1)) + 10; %Branin Function %funguju napr [7.9;8] , [-4.6;3], [2;8]

end