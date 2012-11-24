-module(word_count).
-export([count_words/1]).
-export([split_words/1]).
-import(string).

count_words([])       -> 0;
count_words([_|Tail]) -> 1 + count_words(Tail).

split_words(String)   -> count_words(string:tokens(String, " ")).

