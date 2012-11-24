-module(cart).
-export([calc_item_totals/1]).

% Cart = [{coke, 1, 1.0}, {chips, 3, 2.5}, {ice_cream, 2, 5.0}].
calc_item_totals(List) -> [{Item, Quantity * Price} || {Item, Quantity, Price} <- List].
