function  PSD_(file_name)
close all;
load(file_name);
X_length_Time=length(X(1,:));
figure('NumberTitle','Off','Name','PSD');
X_trans=transpose(X);
PSD=fft(X_trans);
PSD=transpose(PSD);
s=size(PSD);
final_PSD=zeros(1,s(2));
for cPSD=1:s(2)
    final_PSD(1,cPSD)=mean(abs(PSD(:,cPSD)).^2/s(2));
end
PSD_round(1,1:floor(s(2)/2))=abs(final_PSD(1,floor(s(2)/2)+2:s(2)));
PSD_round(1,floor(s(2)/2)+1:s(2))=abs(final_PSD(1,1:floor(s(2)/2)+1));

f=-(X_length_Time)/2:X_length_Time/length(PSD_round):(X_length_Time-1)/2;
plot(f,PSD_round);
title('PSD');
xlabel("Frequency");
ylabel("PSD Values");
end

