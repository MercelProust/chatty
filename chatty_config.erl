%% ---
%%  chatty局域网聊天工具配置文件读取和更新模块
%%---

-module(chatty_config).
-export([load_config/1, update_config/2]).

%% --
%% 从指定的文件路径内读取配置文件内容列表
%% 配置文件内容默认为conf格式
%% --
load_config(ConfigFileName) ->
    case file:consult(ConfigFileName) of
        {ok, ConfigData} ->
            {ConfigData};
        {error, Why} ->
            throw({error, Why})
    end.

%% --
%% 更新指定的列表数据到指定的配置文件内
%% --
update_config(ConfigFileName, ConfigDataList) ->
    unconsult(ConfigFileName, ConfigDataList).

%% --
%% 将列表L的内容写入File内。如果File不存在，则会创建File
%% --
unconsult(File, L) ->
    {ok, S} = file:open(File, write),
    lists:foreach(fun(X) -> io:format(S, "~p.~n", [X]) end, L),
    file:close(S).