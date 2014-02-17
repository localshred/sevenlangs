-module(mymap).
-export([map/2]).

map(F, L) -> [ F(X) || X <- L ].

