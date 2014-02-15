-module(yet_again).
-export([another_factorial/1]).
-export([another_fib/1]).

% 1! == 0
another_factorial(0) ->
  1;
% N! == N * (N-1)!
another_factorial(N) ->
  N * another_factorial(N-1).

% fib(0) == 1
another_fib(0) ->
  1;

% fib(1) == 1
another_fib(1) ->
  1;

% fib(N) == fib(N-1) + fib(N-2)
another_fib(N) ->
  another_fib(N-1) + another_fib(N-2).

