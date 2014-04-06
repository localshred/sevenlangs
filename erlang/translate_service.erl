-module(translate_service).
-export([loop/0, translate/2]).

% Hook up loop function with spawn. Call with translate function below.
% Pid = spawn(fun translate_service:loop/0).
%
loop() ->
  receive
    {From, "casa"} ->
      From ! "house",
      loop();

    {From, "blanca"} ->
      From ! "white",
      loop();

    {From, _} ->
      From ! "I don't understand",
      loop()
  end.

% Send a string to a spawned process, return the received
% translated word.
%
translate(To, Word) ->
  To ! {self(), Word},
  receive
    Translation -> Translation
  end.
