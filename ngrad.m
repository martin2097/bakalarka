function [g] = ngrad(x)
%funkcia rata hodnotu gradientu v danom bode x (rozmer x podla zadaneho
%funkcionalu z funkcional.m)
%gradient je ratany numericky pomocou metody centralnich diferenci
funkcional=@f1;
n = length(x);
g = zeros(n,1);
h = sqrt(eps)*(norm(x)+eps);
fX = funkcional(x);

for i=1:n
    X = x(i);
    x(i) = X+h;
    fR = funkcional(x);
    x(i) = X-h;
    fL = funkcional(x);
    g(i) = (fR-fL)/(2*h);
    x(i) = X;
end

end