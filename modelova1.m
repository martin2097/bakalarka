function [mk] = modelova1(xk,pk)
%jedna sa o funkciu ktora aproximuje funkcional kvadratickym polynomom
%rata jej hodnotu v bode xk a na doverihodnej oblasti dk
funkcional=@f1;
mk=funkcional(xk) + ((ngrad(xk))') * (pk) + 0.5 * (pk)' * nhess(xk) * (pk);

end

%OK