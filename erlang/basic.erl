% Name the module.
-module(basic).

% Export the mirror function for other modules
% to use, indicating it accepts a single parameter.
-export([mirror/1]).

% Define a function called "mirror" that accepts an
% argument and returns that argument.
mirror(Anything) -> Anything.

