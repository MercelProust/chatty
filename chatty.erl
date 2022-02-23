%% ---
%%  chatty局域网聊天工具的主入口模块函数
%%---

-module(chatty).
-export([chatty_main/0]).

chatty_main() -> 
    load_config(),
    start_chatty_server(1069),
    start_chatty_client().

load_config() ->
    chatty_config:load_config("./chatty.conf").

start_chatty_server(Port) ->
    io:format("In start chatty server with port:~B~n", [Port]).

start_chatty_client() ->
    io:format("In start chatty client function~n").