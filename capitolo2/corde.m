function [x,i] = corde( f, f1, x0, tolx, maxit )
    %
    % [x,i] = corde( f, f1, x0, tolx [, maxit] )
    %
    % Metodo delle corde per determinare una approssimazione
    % della radice di f(x) con tolleranza tolx, a
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