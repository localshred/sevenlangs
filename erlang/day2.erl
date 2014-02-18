-module(day2).
-export([fetch/2]).
-export([fetch_fast/2]).

% fetch/2
%
% Fetch the tuple value from a list of tuples where the first argument
% matches the first element of a tuple within the list.
%
% Example
%   c(day2).
%   List = [{erlang,"a functional language"},{ruby,"an OO language"}].
%   day2:fetch(ruby, List).
%   day2:fetch(erlang, List).
%   day2:fetch(foo, List).

% Return an empty list.
fetch(_, []) ->
  [];

% The key matches the first element of the head tuple, so return
% the tuple's second element (value).
fetch(Key, [{Key, Value}|_]) ->
  Value;

% The Key doesn't match the Head tuple first arg,
% so call down the stack on the tail.
fetch(Key, [_|Tail]) ->
  fetch(Key, Tail).

% fetch_fast/2
%
% Fast fetch is simply a reimagining of the above using list comprehensions.
% The one difference is that when the key matches, the value is returned
% wrapped in a list as opposed to the value itself.
%
% Example
%   c(day2).
%   List = [{erlang,"a functional language"},{ruby,"an OO language"}].
%   day2:fetch(ruby, List).
%   day2:fetch(erlang, List).
%   day2:fetch(foo, List).
%
fetch_fast(Key, List) ->
  [ Value || { Key1, Value } <- List, Key1 == Key ].
