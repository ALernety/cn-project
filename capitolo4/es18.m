a=-1;
b=1;
ntot=100;
erreq=zeros(ntot-3,1);
errch=zeros(ntot-3,1);
for n=4:ntot
xeq=linspace(a,b,n+1);
xch=cos((2*linspace(0,n,n+1)*pi)/(2*n+2));
xch(1)=a;
xch(n+1)=b;
xq=linspace(a,b,100);
yeq=cos((pi*(xeq(:).^2))/2);
ych=cos((pi*(xch(:).^2))/2);
yq=cos((pi*(xq(:).^2))/2);
riseq=splinenat(xeq,yeq,xq);
risch=splinenat(xch,ych,xq);
erreq((n-3),1)=norm(yq-riseq);
errch((n-3),1)=norm(yq-risch);
end
x=(4:1:n);

semilogy(x,erreq,x,errch);