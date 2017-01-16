%%%-------------------------------------------------------------------
%%% @author csx
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 一月 2017 上午8:24
%%%-------------------------------------------------------------------
-module(actor_handle).
-author("csx").

%% API
-export([init/2]).

init(Req0, Opts) ->
  Method = cowboy_req:method(Req0),
  HasBody = cowboy_req:has_body(Req0),
  Req = maybe_echo(Method, HasBody, Req0),
  {ok, Req, Opts}.

maybe_echo(<<"POST">>, true, Req0) ->
  {ok, PostVals, Req} = cowboy_req:read_urlencoded_body(Req0),
  Echo = proplists:get_value(<<"echo">>, PostVals),
  echo(Echo, Req);
maybe_echo(<<"POST">>, false, Req) ->
  cowboy_req:reply(400, [], <<"Missing body.">>, Req);
maybe_echo(_, _, Req) ->
  %% Method not allowed.
  cowboy_req:reply(405, Req).



echo(undefined, Req) ->
  cowboy_req:reply(400, [], <<"Missing echo parameter.">>, Req);
echo(Echo, Req) ->
  cowboy_req:reply(200, #{
    <<"content-type">> => <<"text/plain; charset=utf-8">>
  }, Echo, Req).