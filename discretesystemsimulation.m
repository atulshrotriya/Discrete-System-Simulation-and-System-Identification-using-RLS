function discretesystemsimulation
x(1,2)=0;
u=1;
for k=1:1:100
    x(k+1,1)=x(k,2);
    x(k+1,2)=-0.9*x(k,1)+1.85*x(k,2)+u;
end
t=1:1:100;
hold on
stairs(t,x(1:100,1))
stairs(t,x(1:100,2))
end

