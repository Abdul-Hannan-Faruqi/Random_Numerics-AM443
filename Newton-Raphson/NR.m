function x = NR(xst)
%NR Calculates the solution of an eqauation using Newton Raphson method
%    Write the equation to be solved in the 'f' function     
x = xst;
h=0.001;
e = 1e-8;
for i= 1:11
    xn = x - (2*h*f(x)/(f(x+h)-f(x-h)));
    if xn==x
        break;
    end
    x = xn;
end

disp(x)
end

function y = f(x)
%f Evaluates the equation for the argument 'x'
%   Write the equation for y here
%   Example:
%       y = log(x)-1;
%       ans x = 2.7183 (e)
end
