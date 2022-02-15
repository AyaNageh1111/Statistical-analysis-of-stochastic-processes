function  ACF_3D(file_name)
close all;
load(file_name);
X_length_Time=length(X(1,:));
X_length_signal=length(X(:,1));
for i=1:X_length_Time
    for j=1:X_length_Time
        ACF_3D(i,j)=sum(X(:,i).*X(:, j)*(1/X_length_Time));    
    end
end
r=1:X_length_Time;
mesh(r,r,ACF_3D);
end

