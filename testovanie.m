function [xk] = testovanie (x0,d0)
disp('dogleg podla nocedala: ');
trustreg1(x0,d0,1);

disp('dogleg podla matonohy: ');
trustreg1(x0,d0,2);

disp('cauchy: ');
trustreg1(x0,d0,3);

disp('zdruzene gradienty: ');
trustreg1(x0,d0,4);

disp('matlabova funkcia: ');
c=fsolve(@f1,x0)
f1(c)
end