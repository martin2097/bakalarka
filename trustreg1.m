function [xk] = trustreg1 (x0,d0,p)
%p=1 dogleg podla Nocedala
%p=2 dogleg podla Matonohy
%p=3 cauchy
%P=4 zdruzene gradienty
%p=5 dogleg podla bakalarky

%funkcia trustreg hlada minimum funkcionalu pomocou dogleg metody
%jedna sa o Algoritmus 4.1 z Nocedala
%konstanty: m je ni, d je globalne ohranicenie velkosti kroku
%algoritmus zatial funguje v maxn krokoch zadavanych ako argument

tol=eps^(1/3);
maxn=200;

funkcional=@f1;
mu1 = 0.25;
mu2 = 0.75;
omega1 = 0.25;
omega2 = 2;
dkmax = 50;
xk = x0;
dk = d0;
i=0;
for n = 1:maxn
    i=i+1;
    switch p
        case 2 ;pk = dogleg2(xk,dk);
        case 3 ;pk = cauchy(xk,dk);
        case 4 ;pk = zdruzgrad(xk,dk);
        case 5 ;pk = doglegfinal(xk,dk);
    end
    
    di=size(pk,1); 
       
    rok = (funkcional(xk)-funkcional(xk+pk))/(modelova1(xk,zeros(di,1)) - modelova1(xk,pk));
    
    if rok<mu1
       dk=omega1*dk;
    else
       if rok>mu2
           dk=min(omega2*dk,dkmax);
       end    
        
    end
    
    if rok>=mu1 
        xk=xk+pk;     
    end    
   
 %  vystupval(n,1)=funkcional(xk);  
 %  vystupxk(n,1)=xk(1);
 %  vystupxk(n,2)=xk(2);
 %  vystupdk(n,1)=dk;
 %  vystuprok(n,1)=rok;
 %  vystuppk(n,1)=pk(1);
 %  vystuppk(n,2)=pk(2);
 %  vystupcit(n,1)=(funkcional(xk)-funkcional(xk+pk));
 %  vystupmen(n,1)=(modelova1(xk,zeros(di,1)) - modelova1(xk,pk));

if norm(pk)<tol
    %table(vystupxk,vystupdk,vystuprok,vystupcit,vystupmen,vystuppk,vystupval)
    xk
    funkcional(xk)
    X=['iteracie: ',num2str(i)];
disp(X);
    return
end

end

%table(vystupxk,vystupdk,vystuprok,vystupcit,vystupmen,vystuppk,vystupval)
xk
funkcional(xk)
X=['iteracie: ',num2str(i)];
disp(X);

end