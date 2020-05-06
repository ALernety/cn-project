function [x, i] = aitken( f, f1, x0, tolx, maxit )
       %
       % [x,flag] = aitken( f, f1, x0, tolx [, maxit] )
       %
       % Metodo di accelerazione di Aitken per determinare una approssimazione
       % della radice di f(x)=0 con tolleranza (mista) tolx, a
       % partire da x0, entro maxit iterationi (default = 100).
       1
       % f1 implementa f’(x) mentre in uscita flag vale -1, se
       % la tolleranza non `e soddisfatta entro maxit iterate o
       % la derivata si annulla, altrimenti ritorna il numero
       % di iterazioni richieste.
       %
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
              x1 = x0 - fx/f1x;
              fx = feval( f, x1 );
              f1x = feval( f1, x1 );
              x = x1 -fx/f1x;
              x = (x*x0-x1^2)/(x-2*x1+x0);
              if abs(x-x0)<=tolx*(1+abs(x0))
                     flag = i; 
                     break;
              else 
                     x0 = x;
              end
       end
       if abs(x-x0) > tolx*(1+abs(x0))
              error('metodo non converge');
       end
end