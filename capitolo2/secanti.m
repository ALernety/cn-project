function [x,flag] = secanti( f, f1, x0, tolx, maxit )
       %
       % [x,flag] = newton( f, f1, x0, tolx [, maxit] )
       %
       % Metodo di Newton per determinare una approssimazione
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
       fx = feval(f,x0);
       f1x = feval(f1,x0);
       x = x0-fx/f1x;
       flag = -1;
       for i = 1:maxit
              if abs(x-x0)<=tolx*(1+abs(x0))
                     flag = i; 
                     break;
              end
              fx0 = fx;
              fx = feval( f, x );
              if fx-fx0 ==0 
                     break; 
              end
              x1 =(fx*x0-fx0*x)/(fx-fx0);
              x0 = x;
              x = x1;
       end
       if abs(x-x0) > tolx*(1+abs(x0))
              error('metodo non converge');
       end
end