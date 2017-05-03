function [pk] = cauchy(xk,dk)
%funkcia hlada p(k+1) v (k+1)-om kroku pomocou metody cauchyho bodov
%na vstupe je predchadzajuci bod x(k) a vierohodnostna oblast d(k)
gk=ngrad(xk);
Hk=nhess(xk);

pk = -dk*gk/norm(gk); %pocitam smer pk
if gk'*Hk*gk>0 %ak je podmienka <= tak t=1, nemeni pk
 a = min (norm(gk)^3/(dk*gk' * Hk * gk) , 1);   
 pk = a*pk;   
end

end