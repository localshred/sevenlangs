-module(count_to_ten).
-export([count/0]).

% Match a 10, print we're done.
count(10) ->
  io:format("10 yay you're done\n"),
  ok;

% Match a number, print it, and recurse
% with the next number.
count(N) ->
  io:format("~w~n", [N]),
  count(N+1).

% Invoke the count starting at 1.
count() -> count(1).

