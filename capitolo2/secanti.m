function [x,nit,tolf]=secanti(f,x0,x1,tolx,maxit)
  nit=0;
  fx0=feval(f,x0);
  err=abs(x1-x0);
  while (nit<maxit) && (err>tolx)
      fx1=feval(f,x1);
      dfx1=(fx1-fx0)/(x1-x0);
      tolf=tolx*abs(dfx1);
      if abs(fx1)<=tolf
         break
      end
      x2=x1-(fx1/dfx1);
      err=abs(x2-x1);
      x0=x1;
      x1=x2;
      fx0=fx1;
      nit=nit+1;
  end
  x=x1;
end