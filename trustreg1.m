function [xk] = trustreg1 (x0,d0,maxn)
%funkcia trustreg hlada minimum funkcionalu pomocou dogleg metody
%jedna sa o Algoritmus 4.1 z Nocedala
%konstanty: m je ni, d je globalne ohranicenie velkosti kroku
%algoritmus zatial funguje v maxn krokoch zadavanych ako argument
funkcional=@f1;
clearvars vystupxk vystupdk
m = 0.1;
d = 50;
xk = x0;
dk = d0;
for n = 1:maxn
    pk = dogleg(xk,dk);
   if not(isnan(pk))
      di=size(pk,1); 
       
    rok = (funkcional(xk)-funkcional(xk+pk))/(modelova1(xk,zeros(di,1)) - modelova1(xk,pk));
    vystupcit(n,1)=(funkcional(xk)-funkcional(xk+pk));
    vystupmen(n,1)=(modelova1(xk,zeros(di,1)) - modelova1(xk,pk));
    if rok<0.25
       dk=0.25*dk;
    else
       if ((rok>0.75))
           dk=min(2*dk,d);
       end    
        
    end
    
    if rok>m 
        xk=xk+pk;
       
        
    end
   else
       dk=0.25*dk;
      
   end    
   vystupval(n,1)=funkcional(xk);  
   vystupxk(n,1)=xk(1);
   vystupxk(n,2)=xk(2);
   vystupdk(n,1)=dk;
   vystuprok(n,1)=rok;
   vystuppk(n,1)=pk(1);
   vystuppk(n,2)=pk(2);
end

table(vystupxk,vystupdk,vystuprok,vystupcit,vystupmen,vystuppk,vystupval)

end