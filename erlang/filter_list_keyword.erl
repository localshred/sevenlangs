-module(filter_list_keyword).
-export([filter_by_keyword/2]).

filter_by_keyword(List, Keyword) -> [Desc || {X, Desc} <- List, X == Keyword].
