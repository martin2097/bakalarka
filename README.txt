Hlavny skript cez ktory sa spusta hladanie minima je trustreg1.m . Funkcia ma 4 parametre a to konkretne x0 - pociatocny bod, d0 - pociatocna velkost trustregionu, maxn - pocet iteracii, p - parameter na vyber metody (p=1 dogleg podla Nocedala, p=2 dogleg podla matonohy, p=3 cauchyho body). Priklad vstupu:

trustreg1([1;1],2,30,2);

Funkcie na vstupe sa menia cez funkciu f1.m . Funkcia f1 obsahuje aktualne cca 10 funkcii, pozor vsetky su funkcne na metode cauchyho bodov avsak nie na metode dogleg. Dogleg podla Nocedala ma za podmienku poz. def. Hessianu. Dogleg podla Matonohy si tuto podmienku nekladie avsak bod 4 z algoritmu an str 46 zatial nieje implementovany takze metoda nieje rovnako funkcna na funkciach ktore nemaju poz. def. hessian. 

Niektore funkcie maju hessian poz. def. iba na urcitom intervale, v komenataroch k funkciam v f1 su uvedene aj priklady pociatocnych bodov ktore lezia na oblasti kde je hessian poz. def. Testovane pre dk radovo 1~2 kedze funkcie su definovane zvacsa na radovo podobnych oblastiach. 

Na vystupe sa zobrazi tabulka niekolkych sledovanych premennych a ako ans je uvedeny posledny bod do ktoreho sa iteraciou dospelo. Overenie minima pouzivanych funkcii je mozne tu https://www.sfu.ca/~ssurjano/optimization.html

TO DO:
-implementacia bodu 4 z algoritmu 2.5 od Matonohy (str 46)
-zastavovacie kriterium
-volba pociatocnej velkosti trust regionu
-vyriesenie problemu s poz. def. hessianu funkcii na vstupe (overovanie numericky pripadne obidenie tohoto problemu?)
-ak hess nieje poz def vyskusat kombinovanu metodu
