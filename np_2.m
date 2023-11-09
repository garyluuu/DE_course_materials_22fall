clear;clc;clf

%analytical solution
syms T(x)
t=0:0.05:0.5;
hold on
for i=1:length(t)
    T=0;
    if i==1
        T=x^0;
        fplot(x,T,[0,1])
        continue
    end
    for n=1:30
        T=T+4*sin((2*n-1)*pi*x/2)*exp(-(((2*n-1)*pi/2)^2)*t(i))/(pi*(2*n-1));
    end
    fplot(x,T,[0,1])
end

dx=0.05; %set spatial resolution
dt=1e-3; %time step %if dt/(dx^2)=1/2,then dt=1.25e-3

x_range=[0,1]; %spatial range
t_range=[0,0.5]; %time range

N_x=1+((x_range(2)-x_range(1))/dx); %number of grid points
N_t=1+((t_range(2)-t_range(1))/dt); %number of time points

%grid
x=x_range(1):dx:x_range(2);
t=t_range(1):dt:t_range(2);

%initialize U
U=zeros(N_t,N_x);

%apply Initial Condition
U(1,:)=ones(1,length(x));

%apply Boundary Condition
U(:,1)=0;
%U(i,N_x)=4*U(i,N-1)/3-U(i,N-2)/3; heat flux

%calculation loop
for i=1:length(t)-1
    for j=2:length(x)
        if j==N_x
            U(i+1,N_x)=4*U(i+1,N_x-1)/3-U(i+1,N_x-2)/3;
            break
        end
        U(i+1,j)=U(i,j)+dt*(U(i,j+1)+U(i,j-1)-2*U(i,j))/(dx^2);
    end
end

%plot the result
t_point=0:0.05:0.5;
t_plot=int64(t_point/dt+1);
hold on
for i=1:length(t_plot)
    plot(x,U(t_plot(i),:));
end

legend('t=0_{exact}','t=0.05_{exact}','t=0.1_{exact}','t=0.15_{exact}','t=0.2_{exact}','t=0.25_{exact}','t=0.3_{exact}',...
't=0.35_{exact}','t=0.4_{exact}','t=0.45_{exact}','t=0.5_{exact}','t=0','t=0.05','t=0.1','t=0.15','t=0.2','t=0.25','t=0.3',...
't=0.35','t=0.4','t=0.45','t=0.5')
xlabel('x^*')
ylabel('T^*')
% plot(x,U(length(t),:)); %final state