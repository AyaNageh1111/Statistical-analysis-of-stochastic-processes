
function  p_Time_Avg=Plot_M_samples(file_name,M,n,n_th)

load(file_name);

if (n==1)
close all;
load(file_name);
    for i=1:M
        subplot(M,1,i);
        title('Process');
        plot(t, X(i,:));
    end

end
if(n==2)
close all;
load(file_name);
    u(:,:)=X(:,:)*(1/100);
    q(1,:)=sum(u,1);
    plot(t,q);
end
if(n==3)
    close all;
    load(file_name);
    X_length_Time=length(X(n_th,:));
    p_Time_Avg=(sum(X(n_th,:),2))/X_length_Time
end

end