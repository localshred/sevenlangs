-module(tictactoe).
-export([play/1]).

play([ W, W, W,
       _, _, _,
       _, _, _ ]) ->
  W;
play([ _, _, _,
       W, W, W,
       _, _, _ ]) ->
  W;
play([ _, _, _,
       _, _, _,
       W, W, W ]) ->
  W;
play([ W, _, _,
       W, _, _,
       W, _, _ ]) ->
  W;
play([ _, W, _,
       _, W, _,
       _, W, _ ]) ->
  W;
play([ _, _, W,
       _, _, W,
       _, _, W ]) ->
  W;
play([ W, _, _,
       _, W, _,
       _, _, W ]) ->
  W;
play([ _, _, W,
       _, W, _,
       W, _, _ ]) ->
  W;

play([ _, _, _,
       _, _, _,
       _, _, _ ]) ->
  cat.
