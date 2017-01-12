:- encoding(utf8).

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_files)).
:- use_module(library(http/http_error)).

:- [regilo, vidigilo].

startu_servon :-
	http_server(http_dispatch, [port(8080)]).
