function  Time__ACF(file_name,n_ACF)
close all;
load(file_name);
X_length_Time=length(X(1,:));
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

new_taw=1:(X_length_Time-1);

plot(new_taw,Time_ACF);
end

