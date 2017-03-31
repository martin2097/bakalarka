function [pk] = dogleg(xk,dk)
%funkcia hlada pk pomocou dogleg metody
%podla kapitoly o dogleg metode v Nocedalovi


funkcional=@f1;

%if all(eig(nhess(xk)) > 0)         %je to relevantna informacia? chcem overit poz. def. ale mam len aproximaciu
pb = -inv(nhess(xk))*ngrad(xk);
pu = ((-ngrad(xk)'*ngrad(xk))/(ngrad(xk)' * nhess(xk) * ngrad(xk)))*ngrad(xk); %preco toto nefunguje samo o sebe?
pu=pu/norm(pu);
fun=@(t)modelova1(xk,t*pu);

t = fminbnd(fun,0,dk);
pu=t*pu;

if norm(pb)<=dk 
    pk=pb;
else
      
k1=sum((pb-pu).^2);
k2=sum(2*pu.*(pb-pu));
k3=sum(pu.^2)-dk.^2;
t=roots([k1 k2 k3]) ;
if ((t(1)<1) && (t(1)>=0)) 
    pk=pu+t(1)*(pb-pu);
else
    if ((t(2)<1) && (t(2)>=0)) 
    pk=pu+t(2)*(pb-pu);
else
    pk=NaN;
end
end

end

%else
%    pk=NaN
%end    

end