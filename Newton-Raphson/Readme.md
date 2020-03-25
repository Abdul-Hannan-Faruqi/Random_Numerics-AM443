This is a MATLAB implementation of the generalized Newton-Raphson algorithm for solving a system of non-linear equations.

# Usage
## 1. Newton_Raphson (n, varargin)
* The function takes in an integer (**n**) for the number of equations (or variables) and the corresponding equations need to be specified in the '**Fx**' function.
* Use *X(1), X(2),...* etc. for the varaibles in the equation.
* The default starting value for all variables is set to 1. However, the starting vector may be passed to the function as an optional argument.
* Example:

      x = Newton_Raphson(2)         %to find the solution of a system of 2 equations with default starting vector
      x = Newton_Raphson(2, [1;1])  %to find the solution of a system of 2 equations with X = [1;1], i.e. X(1) = 1, X(2) = 1
    >To be specified in the function *Fx*
    >
    >> F(1) = 12 * X(2) + sin(X(1)) - 1;
    >
    >> F(2) = 8 * X(1) - log(X(2)) + 3;

## 2. NR (xst)
* The function finds the solution of a single equation using Newton-Raphson method.
* It takes the initial value (*xst*) of the variable (x) as input.
* The equation to be solved should be specified in the function '**f**'
* Example:

      x = NR (1)  % starts the iteration with x = 1
     > To be specified in the function *f*
     >
     >> y = log(x) - 1 
