function discretesystemsimulationwithnoise
x(1,2)=0;
u=1;
for k=1:1:100
    mu = [0 0];
    sigma = [0.1 0; 0 0.1];
    R = chol(sigma);
    z = repmat(mu,1,1) + randn(1,2)*R;
    x(k+1,1)=x(k,2)+z(1,1);
    x(k+1,2)=-0.9*x(k,1)+1.85*x(k,2)+u+z(1,2);
end
t=1:1:100;
hold on
stairs(t,x(1:100,1))
stairs(t,x(1:100,2))
end
