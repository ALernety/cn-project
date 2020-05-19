function [x, i] = aitken( f, f1, x0, tolx, maxit )
%aitken
%[x,i]=aitken(f,f1, x0, tolx, maxit)
%  Pre: f derivabile
%  Applica il metodo di  accelerazione di aitken per il calcolo della
%  radice (di molteplicita' incognita) dell'equazione f(x)=0 
%  f          -funzione
%  f1         -derivata di f
%  x0         -approssimazione iniziale
% tolx        -tolleranza 
% maxit       -numero massimo di iterazioni(default=100)
% restituisce in x l'approssimazione della radice e in i il numero di iterazioni
% VEDI ANCHE: bisezione, newton, secanti, corde, newtonmod
format long e
if nargin<4 
       error('numero argomenti insufficienti');
elseif nargin==4
        maxit = 100;
end
if tolx<eps 
       error('tolleranza non idonea');
end
x = x0;
for i = 1:maxit
       fx = feval( f, x0 );
       f1x = feval( f1, x0 );
       if f1x==0 
              break; 
       end
       x1 = x0 - fx/f1x;
       fx = feval( f, x1 );
       f1x = feval( f1, x1 );
       if f1x==0 
              break; 
       end
       x = x1 -fx/f1x;
       x = (x*x0-x1^2)/(x-2*x1+x0);
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