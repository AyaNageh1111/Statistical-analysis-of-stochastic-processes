function Total_Avg_Power = Avg_power(file_name)

load(file_name);
X_length_Time=length(X(1,:));
for i=1:X_length_Time

    ACF_3D(i)=sum(X(:,i).*X(:, i)*(1/X_length_Time));

end
Total_Avg_Power=sum(ACF_3D,2);
end

