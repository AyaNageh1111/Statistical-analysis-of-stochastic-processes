
y=[];

load('D:\Probability\Sample_Process.mat');
for i=1:5
    figure(1);
   % subplot(5,1,i);
    title('Process');
    y(i,:)=X(i,:);
 plot(t, X);
    %figure(2);
    %%% Q1: y or X in ensamble avg??
   u(:,:)=X(:,:)*(1/100);
 % title('Processeee');
    
end
%figure(2);

    q(1,:)=sum(u,1);
%g=sum(q(1,:)*t(1,:));
%plot(t,q);
%%%%%%%%%%%%%%%%%% point 3 time avg
%%% Q2: over length or not?? yes over length
n=6;
 X_length_Time=length(X(1,:));
p_Time_Avg=(sum(X(n,:),2))/X_length_Time;
%%%%%%% sum first or 1/100
%%%%%%%%%%%%%%%%%%% point 4 ACF
i=3; j=7;
X_length_signal=length(X(:,n));
ACF=sum(X(:,i).*X(:, j)*(1/X_length_signal),1);
%figure(10);
%stem3(i,j,ACF);
%%%%%%%%%%%%%%%%%% point 5 time ACF
n_ACF=10;
%ACF_Time_Avg

for taw=1:X_length_Time %%%for the same sample
    
    for cell=1:X_length_Time
        if((cell+taw-1)<=X_length_Time)
        Sum_ACF(taw,cell)=(  X(n_ACF, cell)* X(n_ACF, (cell+taw-1)) );
        end
    end
    if (taw<X_length_Time)
    Time_ACF(taw)=sum(Sum_ACF(taw,:),2)/X_length_Time;
    end
end
%figure(3);
new_taw=1:(X_length_Time-1);

plot(new_taw,Time_ACF);

%%% Q3:Which one number and which graph??

%%%%%%%%%%%%%%%%%%%%%% 3D Plotting
figure(4);

for i=1:X_length_Time
    for j=1:X_length_Time
        ACF_3D(i,j)=sum(X(:,i).*X(:, j)*(1/X_length_signal));    
    end
end
r=1:X_length_Time;
mesh(r,r,ACF_3D);
% 
% %%%PSD
figure(5);
figure('NumberTitle','Off','Name','PSD');
X_trans=transpose(X);
PSD=fft(X_trans);
PSD=transpose(PSD);
s=size(PSD);
final_PSD=zeros(1,s(2));
for cPSD=1:s(2)
    final_PSD(1,cPSD)=mean(abs(PSD(:,cPSD)).^2/s(2));
end
%PSD_round(1,1:floor(s(2)/2))=final_PSD(1,floor(s(2)/2)+2:s(2));
%PSD_round(1,floor(s(2)/2)+1:s(2))=final_PSD(1,1:floor(s(2)/2)+1);

f=-(X_length_Time)/2:X_length_Time/length(PSD_round):(X_length_Time-1)/2;
plot(f,PSD);
title('PSD');
xlabel("Frequencies");
ylabel("PSD Values");
% 
% 
% 
% %%%%%%%%%%%%%%%% power Avg
% 
%     
%     for cell=1:X_length_Time
%        
%         Sum_ACF(cell)=(  X(n_ACF, cell)* X(n_ACF, (cell)) );
%         
%     end
%     
%     Time_ACF=sum(Sum_ACF(1),2)/X_length_Time;
%     
% 
% figure(13);
% new_taw=1:(X_length_Time-1);
% plot(new_taw,Time_ACF);
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 

%%%%%%%%%%%%%%%%%%%%%% Avg. power

for i=1:X_length_Time

        ACF_3D(i)=sum(X(:,i).*X(:, i)*(1/X_length_Time));    
    
end
eee=sum(ACF_3D,2);
