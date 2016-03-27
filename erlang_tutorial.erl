% http://learnyousomeerlang.com/introduction#about-this-tutorial

% comment
-module(helloworld).
-export([start/0]).

% calling a function
foo(X) ->
    io:format("hello ~s\n", [X]).


% variables?
-define(Bar, "foobar").
-define(Num, 123).

%modulename:functionname(arguments).
%functionname(arguments).

start() ->
    Code = "Z00887",
    io:fwrite("~p~n", [Code]),
    io:fwrite("Hello, world!\n"),
    io:fwrite(foo("brian")),
    io:fwrite("Bar: ~s~n", [?Bar]),
    io:fwrite("Num: ~p~n", [?Num]).




% compiling:

% $ erlc foo.erl
