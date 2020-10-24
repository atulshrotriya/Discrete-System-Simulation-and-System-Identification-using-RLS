function systemidentificationwithRLS
%fixed and initial values
cov=0.1; Pk1=10000*eye(3); thetak1=zeros(3,1);

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
Sys=thetak1
end