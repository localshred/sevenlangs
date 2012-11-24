-module(count_to_ten).
-export([count_to_ten/0]).

count_to_ten() -> count_up(1, 10).

count_up(End, End) -> End;
count_up(Start, End) -> Next = Start + 1, count_up(Next, End).
