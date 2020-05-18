function [x,i]=aitken(f,f1,x0,tolx, itmax)
       %Metodo di accelerazione di Aitken
       %
       % [x,i]=aitken(f,f1,x0,itmax,tolx,rtolx) 
       %
       %Questo metodo prende in input:
       % f: la funzione di cui si vuol trovare uno zero
       % f1: la derivata della funzione
       % x0: valore di x di partenza
       % imax: numero massimo di iterazioni consentite
       % tolx: tolleranza assoluta sul valore dello zero
       %Questo metodo restituisce:
       % x: zero della funzione
       % i: numero di iterazioni fatte
           i=0;
           fx = feval(f,x0);
           if fx==0
               x=x0;
               return 
           end
           f1x = feval(f1,x0); 
           if f1x==0
               error('La derivata prima ha assunto valore zero, impossibile continuare!') 
           end
           x= x0-fx/f1x;
           go = 1;
           while (i<itmax) && go
               i = i+1;
               x0 = x;
               fx = feval(f,x0);
               f1x = feval(f1,x0);
               if f1x==0
                   %In questo caso non possiamo andare avanti, rimane solo da controllare
                   %se per caso abbiamo trovato una soluzione esatta o almeno nella tolleranza %richiesta
                   if fx == 0
                       %Abbimo trovato una soluzione esatta
                       return
                   elseif (abs(x-x0)<=(tolx*(1 + abs(x0))))
                       %Abbiamo trovato una soluzione nella tolleranza richiesta
                       return
                   end
                   %Evitiamo una divisione per zero.
                   error('La derivata prima ha assunto valore zero, impossibile continuare!') 
               end
               x1 = x0-fx/f1x;
               fx = feval(f,x1); f1x = feval(f1,x1); 
               if f1x==0
                   if fx == 0 
                       return
                   elseif (abs(x-x0)<=(tolx*(1 + abs(x0))))
                       return
                   end
                   error('La derivata prima ha assunto valore zero, impossibile continuare!')
               end
               x = x1 - fx/f1x;
               t = ((x-2*x1)+x0);
               .
               if t == 0
                   if feval(f,x) == 0 
                       return
                   end
                   error('Impossibile determinare la radice nella tolleranza desiderata') 
               end
               x = (x*x0-x1^2)/t;
               go = (abs(x-x0)>(tolx*(1 + abs(x0))));
           end
           if go, disp('Il metodo non converge.'), end