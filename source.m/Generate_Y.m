theta = unifrnd(0,2*pi,1,1000);
omega = (3/4)*pi;
A = 4;
t = [-10:0.01:5];
theta_len= length(theta);
time_len= length(t);
for row=1:theta_len
    for cell=1:time_len
       X(row,cell)= (A * sin((omega * t(cell)) + theta(row))) + (0.5 * A * cos((2* omega* t(cell)) + theta(row)/3));    
    end
end