function [x,i] = newton( f, f1, x0, tolx, maxit )
       %
       % [x,i] = newton( f, f1, x0, tolx [, maxit] )
       %
       % Metodo di Newton per determinare una approssimazione
       % della radice di f(x)=0 con tolleranza  tolx, a
       % partire da x0, entro maxit iterationi (default = 100).
      
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
              fx = feval( f, x );
              f1x = feval( f1, x );
              x = x - fx/f1x;
              if abs(x-x0)<=tolx*(1+abs(x0))
                     break;
              else 
                     x0 = x;
              end
       end

end