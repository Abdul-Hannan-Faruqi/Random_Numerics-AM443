function [ x ] = Newton_Raphson( n, varargin )
%Newton_Raphson Solver based on Newton-Raphson method for 'n' equations
%   Calculates the solution of the system of non-linear equations given in Fx
p = inputParser;
defaultx = ones(n,1);     %Initialize solution with zeros

addRequired(p,'n',@isnumeric);              %Required argument
addOptional(p,'x',defaultx, @isnumeric);    %Optional argument
parse(p, n, varargin{:})                    %Parsing the inputs
x = p.Results.x;

pb = zeros(1,n);    %array of function values at backward neighbour 
p = zeros(n,1);     %array of function values at the current x
pf = zeros(1,n);    %array of function values at forward neighbour
a = zeros(n,n);     %transpose of Jacobian matrix
h=0.001;            %difference used for central differencing
e = 1e-8;           %Error tolerance
err = 1;            %Error Initialization
pl = transpose(x);
iter = 1;
while err > e
    for i=1:n
        shift = zeros(n,1);
        shift(i) = 1;
        pb(:) = Fx(x-(h*shift));
        pf(:) = Fx(x+(h*shift));
        a(i,:) = (pf-pb)/(2*h);
    end
    p(:) = Fx(x);
    J = transpose(a);   %Jacobian matrix
    xn = x - inv(J)*p;  %xn = calculated x after the iteration
    err = abs(xn-x);
    x = xn;
    iter = iter+1;
    pl(iter, :) = x;
end
figure
for i = 1:n
    plx = linspace(1,iter, iter);
    ply = transpose(pl(:,i));
    plot(plx, ply);
    hold on
end
xlabel('Iteration');
ylabel('X');
hold off
end

function [F] = Fx(X)
%Fx Calculates the output of functions F(i) for the given vector X
%   Evaluates the equations that need to be specified as in the example
%   F(1) = enter first function;
%   F(2) = enter second function;
%Example: for n = 2
%   F(1) = 12*X(2)+sin(X(1))-1;
%   F(2) = 8*X(1)-log(X(2))+3;
end
