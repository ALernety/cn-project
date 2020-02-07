function x1=radn(n,x)
%
% funzione Matlab che implementa il metodo di newtown per il calcolo della 
% radice n-esima di un numero positivo x  
%
imax=1000;
tolx=1/1000;
if x<=0,
    error('valore in ingresso errato');
end
x0=x/2;
for i=1:imax
   fx=x0^n-x;
   fx1=(n-1)*x0^(n-1);
   x1=x0-fx/fx1;
   if abs(x1-x0)<=tolx,
       break
   end
   x0=x1;
end
if abs(x1-x0)>tolx,
    error('metodo non converge')
end
    
   
