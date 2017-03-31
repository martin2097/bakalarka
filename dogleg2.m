function [pk] = dogleg2(xk,dk)
%dogleg podla matonohy str 46

ni=ngrad(xk)'*nhess(xk)*ngrad(xk);
if ni<=0
    pk=(-dk/norm(ngrad(xk)))*ngrad(xk);
    return
end

xc=((-ngrad(xk)'*ngrad(xk))/(ngrad(xk)' * nhess(xk) * ngrad(xk)))*ngrad(xk);
if norm(xc)>=dk
    pk=(-dk/norm(ngrad(xk)))*ngrad(xk);
    return
end

xn=(-inv(nhess(xk)))*ngrad(xk);

%ako naprogramovat krok 4?

if norm(xn)<=dk
    pk=xn;
    return
end

if (xn-xc)'*xc<=0
    k1=sum((xn-xc).^2);
    k2=-sum(2*xc.*(xn-xc));
    k3=sum(xc.^2)-dk.^2;
    k=roots([k1 k2 k3]);
    
    if ((k(1)<1) && (k(1)>=0)) 
    pk=xc-k(1)*(xn-xc);
    return
    else
        if ((k(2)<1) && (k(2)>=0)) 
        pk=xc-k(2)*(xn-xc);
        return
        else
        pk=NaN;
        return
        end
    end
end

%moznost pridat modifikaciu gama z kroku 7

if norm(xn)<=dk
    pk=(-dk/norm(xn))*xn;
    return
end

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


end