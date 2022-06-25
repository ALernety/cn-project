function [x,i] = corde( f, f1, x0, tolx, maxit )
%corde
%[x,i]=corde(f,f1, x0, tolx, maxit)
%Pre: f derivabile
%  Applica il metodo delle corde per il calcolo della
%  radice dell'equazione f(x)=0 
%  f          -funzione
%  f1         -derivata di f
%  x0         -approssimazione iniziale
% tolx        -tolleranza 
% maxit       -numero massimo di iterazioni(default=100)
% restituisce in x l'approssimazione della radice e in i il numero di iterazioni
% VEDI ANCHE: bisezione, newton, secanti, aitken, newtonmod
   
    format long e
    if nargin<4 
           error('numero argomenti insufficienti');
    elseif nargin==4
            maxit = 100;
    end
    if tolx<eps 
           error('tolleranza non idonea');
    end
    f1x = feval(f1, x0);
    x = x0;
    for i = 1:maxit
           fx = feval( f, x );
           if fx==0 
                  break; 
           end
           x = x - fx/f1x;
           if abs(x-x0)<=tolx*(1+abs(x0))
                  break;
           else 
                  x0 = x;
           end
    end
    if abs(x-x0) > tolx*(1+abs(x0))
       error('metodo non converge'); 
     end
end