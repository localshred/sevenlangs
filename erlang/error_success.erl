-module(error_success).
-export([error_or_success/1]).

% Print the error message if given a
% tuple with key error and any value.
error_or_success({error, Message}) ->
  io:format("error: ~s~n", [Message]);

% Print the success atom if it's
% the argument given.
error_or_success(success) ->
  io:format("~w~n", [success]).
