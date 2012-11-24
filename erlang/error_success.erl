-module(error_success).
-export([print_state/1]).

print_state({error, Message}) -> string:concat("error: ", Message);
print_state(_) -> "success".
