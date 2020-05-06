function [x, i]=secanti(f,x0,x1,tolx,maxit)
   %
       % [x,i] = secanti( f,  x0, x1, tolx [, maxit] )
       %
       % Metodo delle secanti per determinare una approssimazione
       % della radice di f(x)=0 con tolleranza  tolx, a
       % partire da x0, entro maxit iterationi (default = 100).
  format long e
  if nargin<4 
    error('numero argomenti insufficienti');
  elseif nargin==4
    maxit = 100;
  end
  i=0;
  fx0=feval(f,x0);
  for i=1:maxit
      fx1=feval(f,x1);
      dfx1=(fx1-fx0)/(x1-x0);
      x=x1-(fx1/dfx1);
      if abs(x1-x0)<=tolx*(1+abs(x0))
        break;
      end
      x0=x1;
      x1=x;
      fx0=fx1;
      
  end
  if abs(x-x0) > tolx*(1+abs(x0))
    error('metodo non converge'); 
  end
end