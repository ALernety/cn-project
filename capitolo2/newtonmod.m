function [x, i] = newtonmod( f, f1,  x0, m, tolx, maxit )
%NEWTONMOLT
%[x,i]=Newtonmolt(f,f1,x0,m,tolx,maxit)
%  Pre: f derivabile
%  Applica il metodo di Newton per il calcolo della
%  radice (di molteplicita' nota r) dell'equazione f(x)=0 
%  f          -funzione
%  f1         -derivata di f
%  x0         -approssimazione iniziale
%  m          -molteplicita' della radice
% tolx        -tolleranza 
% maxit       -numero massimo di iterazioni(default=100)
% restituisce in x l'approssimazione della radice e in i il numero di iterazioni
% VEDI ANCHE: bisezione, newton, secanti, corde, aitken
   
    format long e
    if nargin<5 
           error('numero argomenti insufficienti');
    elseif nargin==5 
            maxit = 100;
    end
    if tolx<eps 
           error('tolleranza non idonea');
    end
    x = x0;
    for i = 1:maxit
           fx = feval( f, x );
           f1x = feval( f1, x );
           if fx==0 
                  break; 
           end
           x = x - m*(fx/f1x);
           if abs(x-x0)<=tolx*(1+abs(x0))
                  break;
           else 
                  x0 = x;
           end
    end

end