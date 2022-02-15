function ACF = ith_jth(file_name,i,j)
close all;
load(file_name);
X_length_signal=length(X(:,1));
ACF=sum(X(:,i).*X(:, j)*(1/X_length_signal),1);
stem3(i,j,ACF);
end

