function ComparisonofEstimatedandActualOutputs
%fixed and initial values
cov=0.1; Pk1=1e6*eye(3); thetak1=zeros(3,1); Yhat=zeros(601,1); xp=zeros(2,1);

%retrieving data
filename='Input Output data.xls';
T=readtable(filename);
uin=str2double(T{3:603,3});
yout=str2double(T{3:603,5});

%estimating system parameters
for k=3:601
    hk1=[-yout(k-1);-yout(k-2);uin(k-2)];
    Pk1=Pk1-Pk1*hk1*(inv(transpose(hk1)*Pk1*hk1+cov))*(transpose(hk1))*Pk1;
    thetak1=thetak1+Pk1*(hk1/cov)*(yout(k)-(transpose(hk1))*thetak1);
end

%output from estimated parameters
for k=1:601
    Yhat(k)=[thetak1(3) 0]*xp;
    xp=[0 1;-thetak1(2) -thetak1(1)]*xp+[0;1]*uin(k);
end

%comparison plots
figure(1)
plot(1:601,yout,'r')
figure(2)
plot(1:601,Yhat,'')
figure(3)
subplot(1,2,1)
plot(1:601,yout,'r')
subplot(1,2,2)
plot(1:601,Yhat,'')
figure(4)
subplot(2,1,1)
plot(1:601,yout,'r')
subplot(2,1,2)
plot(1:601,Yhat,'')
figure(5)
hold on
plot(1:601,yout,'r','linewidth',1)
plot(1:601,Yhat,'k:','linewidth',2)
end