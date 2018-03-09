function y = weibull(x,xdata) 
%LET is greater than the threshold in LET therefore we use the second equation
y = x(1).*(1-exp(-((xdata-x(4)))./x(2)).^x(3)); %weibull function equation where 
% x(1) is C_s, x(4) is L_0, x(2) is W and x(3) is S

end

