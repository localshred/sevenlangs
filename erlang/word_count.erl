-module(word_count).
-export([simple_count_words/1]).
-export([count_word_tokens/1]).

% Ask the string module for the number of "words".
simple_count_words(Sentence) ->
  string:words(Sentence).

% Ask the string module for a list of tokens
% from the sentence and return its length.
count_word_tokens(Sentence) ->
  length(string:tokens(Sentence, " ")).

