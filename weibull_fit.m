close all
E_b = [0.6, 0.72, 9.6, 4.8, 20, 56, 84, 786]; %energy of beam from appendix
F = [25e6, 25e6, 25e6, 17e6, 23e6, 10e6, 7e6, 4e6]; % Flux from appendix
et = [5, 5, 5, 5, 5, 10, 10, 15]; %exposure time from appendix
flip = [8, 7497, 22514, 23986, 33810, 29991, 21022, 18043]; %number of flips from appendix
u = [12,12, 12, 16, 40, 56, 84 ,131];  %atomic number from appendix

sigma = zeros (8,1);
E = zeros (8 ,1);
for i=1:8 %to calculate for each instancec in the table in the appendix
    sigma(i) = flip(i)./(et(i).*60.*F(i)); %cross section
    E(i) = E_b(i)./u(i); %Energy
end

LET = [2.5, 3, 4.7, 6, 17, 27, 38, 57]'; %as read from the CREME stopping power in silicon graph

x= abs(lsqcurvefit(@weibull ,[5e-6, 3.4, 0.1, 1] , LET , sigma, zeros(1,4), ones(1,4)*5, optimset('TolFun',1e-60))) %fit weibull curve over data points
clf reset ;

xdata=linspace(x(2), 60, 100);
hold on
plot(LET, sigma, 'm+');
plot(xdata,weibull(x,xdata));
xlabel (' LET ( MeV cm ^2/ mg )')
ylabel ('\sigma ( LET ) ( cm ^2)')
hold off
grid on


