function [mk] = modelova(xk,dk)
%jedna sa o funkciu ktora aproximuje funkcional kvadratickym polynomom
%rata jej hodnotu v bode xk a na doverihodnej oblasti dk
funkcional=@f1;
mk=funkcional(xk) + ((ngrad(xk))') * cauchy(xk,dk) + 0.5 * (cauchy(xk,dk)') * nhess(xk) * cauchy(xk,dk);

end