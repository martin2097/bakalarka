function [pk] = zdruzgrad(xk,dk)
epsilon=0.1;

x=0;
r=ngrad(xk);
pk=-r;

%1)
ni=pk'*nhess(xk)*pk;
if ni<=0
k1=sum((pk).^2);
k2=sum(2*x.*pk);
k3=sum(x.^2)-dk.^2;
t=roots([k1 k2 k3]) 
if t(1)>0 
    pk=x+t(1)*pk;
else
    if t(2)>0 
    pk=x+t(2)*pk;
end
end    
      return
end

%2)

alfa=(r'*r)/ni;
xp=x;
x=x+alfa*pk;

if norm(x)>dk
k1=sum((pk).^2);
k2=sum(2*xp.*pk);
k3=sum(xp.^2)-dk.^2;
t=roots([k1 k2 k3]) 
if t(1)>0 
    pk=xp+t(1)*pk;
else
    if t(2)>0 
    pk=xp+t(2)*pk;
end
end    
      return
end

if norm(x)==dk
   pk=x; 
   return 
end

%3)

rp=r;
r=r+alfa*nhess(xk)*pk;

if norm(r)<=epsilon*norm(ngrad(xk))
pk=x;
return
end

%4)

beta=(r'*r)/(rp'*rp);
pk=-r+beta*pk;

end