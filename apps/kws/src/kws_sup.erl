-module(kws_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%% Helper macro for declaring children of supervisor
-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    KwsInitializer = {kws_init_handler, {kws_init_handler, start_link, []}, transient, brutal_kill, worker, [kws_init_handler]},
    {ok, { {one_for_one, 1, 10}, [KwsInitializer]} }.

