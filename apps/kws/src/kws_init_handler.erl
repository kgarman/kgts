%%
%%
%%

-module(kws_init_handler).
-author('kehnneh@gmail.com').

-behaviour(gen_server).

-export([
    init/1,
    terminate/2,
    code_change/3,
    handle_call/3,
    handle_cast/2,
    handle_info/2
]).

-export([start_link/0]).

-record(state, {}).

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

init([]) ->
    self() ! timeout,
    {ok, #state{}}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

handle_call(_Request, _From, State) ->
    {reply, {error, einval}, State}.

handle_cast(_Request, State) ->
    {noreply, State}.

handle_info(timeout, State) ->
    {ok, Global} = application:get_env(global_conf),
    Id = proplists:get_value(id, Global),
    {ok, Servers} = application:get_env(server_confs),
    {ok, DocRoot} = application:get_env(docroot),
    {ok, SCList, GC, ChildSpecs} = yaws_api:embedded_start_conf(DocRoot, Servers, Global, Id),
    [supervisor:start_child(kws_sup, C) || C <- ChildSpecs],
    yaws_api:setconf(GC, SCList),
    {stop, normal, State};
handle_info(_Request, State) ->
    {noreply, State}.

