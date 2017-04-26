function [pk] = doglegfinal(xk,dk)
%dogleg podla matonohy str 46

%1) kontrola poz def
if (ngrad(xk)'*nhess(xk)*ngrad(xk))<0
pk=cauchy(xk,dk); %ak hessian nieje poz def pouzijem cauchyho bod
    %disp('1');
    return
end

% spocitam cacuhyho bod
xc=((-ngrad(xk)'*ngrad(xk))/(ngrad(xk)' * nhess(xk) * ngrad(xk)))*ngrad(xk);

%2) cauchyho bod lezi mimo trust regionu
if norm(xc)>=dk
    pk=(-dk/norm(ngrad(xk)))*ngrad(xk);
    %disp('2');
    return
end

% zrataj newtnov bod
xn=nhess(xk)\(-ngrad(xk));


%3) kontrola klesania
if xc'*(xn-xc)<=0
    pk=cauchy(xk,dk);
    %disp('3');
    return
end
    
    
%4) Newtnov bod lezi v trust regione
if norm(xn)<=dk
    pk=xn;
    %disp('4');
    return
end

%5) riesenie na doglegu
k1=sum((xn-xc).^2);
k2=sum(2*xc.*(xn-xc));
k3=sum(xc.^2)-dk.^2;
t=roots([k1 k2 k3]) ;
if ((t(1)<1) && (t(1)>=0)) 
    pk=xc+t(1)*(xn-xc);
else
    if ((t(2)<1) && (t(2)>=0)) 
    pk=xc+t(2)*(xn-xc);
else
    pk=NaN;
end
end

%disp('5');
end