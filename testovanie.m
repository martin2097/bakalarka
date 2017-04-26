function [xk] = testovanie (x0,d0)
disp('dogleg podla matonohy: ');
tic
trustreg1(x0,d0,2);
toc

tic
disp('cauchy: ');
trustreg1(x0,d0,3);
toc

tic
disp('zdruzene gradienty: ');
trustreg1(x0,d0,4);
toc

tic
disp('dogleg bakalarka: ');
trustreg1(x0,d0,5);
toc

tic
disp('matlabova funkcia: ');
c=fsolve(@f1,x0)
f1(c)
toc
end