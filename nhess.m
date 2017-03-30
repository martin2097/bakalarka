function [H] = nhess(x)
%funkcia rata hodnotu hessianu v danom bode x (rozmer x podla zadaneho
%funkcionalu z funkcional.m)
%hessian je ratany numericky pomocou metody centralnich diferenci
funkcional=@f1;
n = length(x);
H = zeros(n);
h = sqrt(eps)*(norm(x)+eps);

gX = ngrad(x);

for i=1:n
    X = x(i);
    x(i) = X+h;
    gR = ngrad(x);
        
        x(i) = X-h;
        gL = ngrad(x);       
        v = (gR-gL)/(2*h);
        
    H(i,:) = v';
    x(i) = X;
end

end

