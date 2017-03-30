function [pk] = cauchy(xk,dk)
%funkcia hlada p(k+1) v (k+1)-om kroku pomocou metody cauchyho bodov
%na vstupe je predchadzajuci bod x(k) a vierohodnostna oblast d(k)

pk = -dk*ngrad(xk)/norm(ngrad(xk)); %pocitam smer pk
if ngrad(xk)'*nhess(xk)*ngrad(xk)>0 %ak je podmienka <= tak t=1, nemeni pk
 a = min (norm(ngrad(xk))^3/(dk*ngrad(xk)' * nhess(xk) * ngrad(xk)) , 1);   
 pk = a*pk;   
end

end