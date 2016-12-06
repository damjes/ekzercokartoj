:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).

:- [regilo, vidigilo].

startu_servon :-
	http_server(http_dispatch, [port(8080)]).
