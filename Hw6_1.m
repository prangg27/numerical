hold off
%homework 1.1
x = -5:0.1:5 ;
Y = 5*x.^4 +1;
plot(x,Y,'k-') 
q1 = integral(@(x)  5*x.^4 +1 ,-5,5)
hold on

% function to  (x,y)
%xr = -5 + (5+5)*rand(1,11)
xr = [-2.41198346838682	4.73702708957246	-2.35639705158325	2.89940849883973	-0.0293107884313262	-1.79214734929590	1.16282788890271	-4.93105850101219	-4.37066346321500	4.20024967794440	4.06163694464487];
yr = 5*xr.^4 +1;

[xsorted, idx] = sort(xr, 'ascend');
ysorted = yr(idx);
plot(xsorted,ysorted,'ro')


%>>equation form chapter5
m = polyfit (xsorted,ysorted,9);
yp = polyval (m , xsorted) ;
plot (xsorted,yp,'b-')



%trap orderpair
sum = 0; n=10;
for i = 1:1:n
    width = abs(xsorted(i+1)-xsorted(i));
    areasq = (width/2)*(ysorted(i)+ysorted(i+1));
    sum=sum + areasq;
end
ans_trapz_orderedpair = sum


%6.3
%trap eqation
x = -5:1:5 ;
Y = 5*x.^4 +1 ;
Z = trapz(x,Y);
ans_trapz_eq_10section = Z
x = -5:0.1:5 ;
Y = 5*x.^4 +1 ;
Z = trapz(x,Y);
ans_trapz_eq_100section = Z


%simpson orderpair
sum_simson = 0;
for i = 1:1:n
    xmid = (xsorted(i)+xsorted(i+1))/2;
    ymid = (ysorted(i)+ysorted(i+1))/2;
    width_sim = abs((xsorted(i+1)-xsorted(i))/2);
    %fprintf(' i = %d, i+1 = %d',i,i+1)
    area = (width_sim/3)*(ysorted(i)+4*ymid+ysorted(i+1));
    
    sum_simson=sum_simson + area;
end
ans_simpson_orderpair = sum_simson

%simpson equation
a = -5;b=5;h = (b-a)/n ; n=10;
f = @(x) 5*x.^4 +1 ;
Odd = 0;
Even = 0;
for i = 1:2:n-1
    xi=a+(i*h);
    Odd=Odd+f(xi);
end
for i = 2:2:n-2
    xi=a+(i*h);
    Even=Even+f(xi);
end
I = (h/3)*(f(a)+f(b)+4*Odd+2*Even);
ans_simpson_eq = I



%add error
%xe = -5 + (5+5)*rand(1,11)
xe = [-0.754258132325249	-2.76916054927202	-3.63604907413744	-2.39824345888002	0.444653829897622	-4.17791607980575	0.981273133265461	-4.70813821600632	-0.450911023120957	-1.67501315811390	4.43672831555840];
for i = 1:1:length(xe)
   ee = 300;
   %err = (ee-rand*2*ee);
   err = 1.599102053383089e+02;
   yerr(i) = err + (5*xe(i).^4 +1);
end
plot (xe,yerr,'g*')
hold on

%>>equation error form chapter5
[xesorted, idx] = sort(xe, 'ascend');
yerrsorted = yerr(idx);

m_err = polyfit (xesorted,yerrsorted,5); 

eq_yerr = polyval (m_err , xesorted) ;
plot (xesorted,eq_yerr,'c-')


%trapz orderpair error
sum = 0;
for i = 1:1:n
    width = abs(xesorted(i+1)-xesorted(i));
    areasq = (width/2)*(yerrsorted(i)+yerrsorted(i+1));
    sum=sum + areasq;
end
ans__trapz_error_orderpair = sum

%simpson orderpair error
sum_simson = 0;
for i = 1:1:n
    xmid = (xesorted(i)+xesorted(i+1))/2;
    ymid = (yerrsorted(i)+yerrsorted(i+1))/2;
    width_sim = abs((xesorted(i+1)-xesorted(i))/2);
    %fprintf(' i = %d, i+1 = %d',i,i+1)
    area = (width_sim/3)*(yerrsorted(i)+4*ymid+yerrsorted(i+1));
    
    sum_simson=sum_simson + area;
end
ans_simpson_error_orderpair = sum_simson



%trap error eqation
n = 10; 
x = -5:1:5 ;
Y = 5*x.^4 +160.9102 ;
Z = trapz(x,Y);
ans_trapz_error_eq = Z

%simpson error equation
f = @(x) 5*x.^4 +160.9102 ;

Odd = 0;
Even = 0;
for i = 1:2:n-1
    xi=a+(i*h);
    Odd=Odd+f(xi);
end
for i = 2:2:n-2
    xi=a+(i*h);
    Even=Even+f(xi);
end
I = (h/3)*(f(a)+f(b)+4*Odd+2*Even);
ans_simson_error_eq = I
