function [pk] = zdruzgrad(xk,dk)
epsilon=0.1;
gk=ngrad(xk);
Hk=nhess(xk);

r=gk;
pk=0;
d=-r;
spinac=1;
while spinac<150
%1)
ni=d'*Hk*d;
pkp=pk;
if ni<=0
k1=sum((d).^2);
k2=sum(2*d.*pk);
k3=sum(pk.^2)-dk.^2;
t=roots([k1 k2 k3]); 
if t(1)>0 
    pk=pk+t(1)*d;
    return
else
    if t(2)>0 
    pk=pk+t(2)*d;
    return
end
end    
return     
end

%2)

alfa=(r'*r)/ni;
pk=pk+alfa*d;

if norm(pk)>dk
k1=sum((d).^2);
k2=sum(2*d.*pkp);
k3=sum(pkp.^2)-dk.^2;
t=roots([k1 k2 k3]) ;
if t(1)>0 
    pk=pkp+t(1)*d;
    return
else
    if t(2)>0 
    pk=pkp+t(2)*d;
    return
end
end    
      return
end

if norm(pk)==dk
   return 
end

%3)

rp=r;
r=r+alfa*Hk*d;

if norm(r)<=epsilon*norm(gk)
return
end

%4)

beta=(r'*r)/(rp'*rp);
d=-r+beta*d;
spinac=spinac+1;
end
end