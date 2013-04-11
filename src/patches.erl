%%
%% Copyright (c) April 2013 
%% Patches created by : Jorge Garrido  <zgbjgg@gmail.com>
%% Oficial page: https://github.com/jorgegarrido	
%%
-module(patches).
-author('zgbjgg@gmail.com').
-vsn("0.1").

-export([upgrade_ie10/1]).

%% this is for a stupid issue on IE browser, the headers in the request contain
%% a variable called 'Upgrade' which value is or must be "websocket" but IE sends
%% "Websocket" instead, with a first letter in mayus, then convert all letter to lowercase!!
-spec upgrade_ie10(Headers :: list()) -> list().
upgrade_ie10(Headers) ->
    case proplists:get_value('Upgrade', Headers) of 
        undefined -> 
	    Headers; 
	Upgrade   -> 
    	    [{'Upgrade', string:to_lower(Upgrade)} | proplists:delete('Upgrade', Headers)]
    end.
