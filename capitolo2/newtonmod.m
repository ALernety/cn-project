function [x,i] = newtonmod( f, f1,  x0, m, tolx, maxit )
    %
    % [x,i] = newton( f, f1, x0, m, tolx [, maxit] )
    %
    % Metodo di Newton modificato per determinare una approssimazione
    % della radice  con molteplicità m di f(x), con tolleranza tolx, a
    % partire da x0, entro maxit iterationi (default = 100).
   
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
           x = x - m*fx/f1x;
           if abs(x-x0)<=tolx*(1+abs(x0))
                  break;
           else 
                  x0 = x;
           end
    end

end