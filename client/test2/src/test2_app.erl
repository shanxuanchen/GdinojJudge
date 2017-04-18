%%%-------------------------------------------------------------------
%% @doc test2 public API
%% @end
%%%-------------------------------------------------------------------

-module(test2_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    rabbitmq_factory:start_link(),
    test2_sup:start_link(),
    comsumer:comsume().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
