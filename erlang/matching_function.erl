-module(matching_function).
-export([number/1]).

% Match the one atom and return a 1
number(one) -> 1;
% Match the two atom and return a 2
number(two) -> 2;
% Match the three atom and return a 3
number(three) -> 3.
