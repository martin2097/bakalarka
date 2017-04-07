function [pk] = dogleg2(xk,dk)
%dogleg podla matonohy str 46

%exit 1 - ak hessian nieje poz def
%exit 2 - ak cauchyho bod lezi mimo trust regionu
%exit 3 - ak je hessian singularny a k(1)>0
%exit 4 - ak je hessian singularny a k(2)>0
%exit 5 - ak je hessian singularny a rovnica nema kladny koren
%exit 6 - ak je newtonov bod v trust regione
%exit 7 - ak je (xn-xc)'*xc<=0 a k(1)>0
%exit 8 - ak je (xn-xc)'*xc<=0 a k(2)>0
%exit 9 - ak je (xn-xc)'*xc<=0 a rovnica nema kladny koren
%exit 10 - ak modifikovany newtnov bod lezi v trust regione
%exit 11 - bod sa najde na doglegu

[L,p]=chol(nhess(xk)); %parameter p>0 ak hessian v xk nieje poz def

%1)
if p>0
pk=cauchy(xk,dk); %ak hessian nieje poz def pouzijem cauchyho bod
    disp('1');
    return
end

%2)
xc=((-ngrad(xk)'*ngrad(xk))/(ngrad(xk)' * nhess(xk) * ngrad(xk)))*ngrad(xk);
if norm(xc)>=dk
    pk=(-dk/norm(ngrad(xk)))*ngrad(xk);
    disp('2');
    return
end



%3+4)
if rank(nhess(xk))==size(nhess(xk),1) %ak je hessian v xk regularny
    xn=nhess(xk)\(-ngrad(xk));  %urcim newtonov bod
else
    [L,D,P]=ldlt_symm(nhess(xk)); 
    di=size(D,1);
    ek=zeros(di,1);
    ek(di)=1;
    v=(inv(L))'*ek;
    v=v/norm(v);
    
    k1=sum((v).^2);
    k2=-sum(2*xc.*v);
    k3=sum(xc.^2)-dk.^2;
    k=roots([k1 k2 k3]);
    
    if ((k(1)<1) && (k(1)>=0)) 
    pk=xc+k(1)*v;
    disp('3');
    return
    else
        if ((k(2)<1) && (k(2)>=0)) 
        pk=xc+k(2)*v;
        disp('4');
        return
        else
        pk=NaN;
        disp('5');
        return
        end
    end
end

%5)
if norm(xn)<=dk
    pk=xn;
    disp('6');
    return
end

%6)
if (xn-xc)'*xc<=0
    k1=sum((xn-xc).^2);
    k2=-sum(2*xc.*(xn-xc));
    k3=sum(xc.^2)-dk.^2;
    k=roots([k1 k2 k3]);
    
    if ((k(1)<1) && (k(1)>=0)) 
    pk=xc-k(1)*(xn-xc);
    disp('7');
    return
    else
        if ((k(2)<1) && (k(2)>=0)) 
        pk=xc-k(2)*(xn-xc);
        disp('8');
        return
        else
        pk=NaN;
        disp('9');
        return
        end
    end
end

%7)
%gama=(xc'*xc)/(xn'*xc);
gama=1;

%8)
if norm(gama*xn)<=dk
    pk=(-dk/norm(xn))*xn;
    disp('10');
    return
end

%9)
k1=sum((gama*xn-xc).^2);
k2=sum(2*xc.*(gama*xn-xc));
k3=sum(xc.^2)-dk.^2;
t=roots([k1 k2 k3]) ;
if ((t(1)<1) && (t(1)>=0)) 
    pk=xc+t(1)*(gama*xn-xc);
else
    if ((t(2)<1) && (t(2)>=0)) 
    pk=xc+t(2)*(gama*xn-xc);
else
    pk=NaN;
end
end

disp('11');
end