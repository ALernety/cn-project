function x =Newton(myf,df,x0,tolx,maxit)
       x = x0;
       for i = 1:maxit
              fx = feval(myf,x0);
              dfx = feval(df,x0);
              x0 = x;
              x = x0-fx/dfx;
              if abs(x-x0)<=tolx*(1+abs(x0))
                     break
              end
              
       end
       if abs(x-x0)>=tolx
              error('metodo non convergente');
              
       end
   end