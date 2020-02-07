function x = newton(f,df,x0,imax,tol)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
format long
xold = x0;

for i = 1:imax
x = feval(f,xold);
dfx = feval(df,xold);
x = xold - x/dfx;
xold = x;
tolx = tol*(1 + abs(xold));
if abs(x-xold)<=tolx
       break
end
end

