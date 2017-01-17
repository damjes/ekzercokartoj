:- encoding(utf8).

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/http_wrapper)).
:- use_module(library(http/http_session)).
:- use_module(library(http/http_client)).

:- ['modelo/konsilu'].
:- ['regilo/konsilu'].
:- ['vidigilo/konsilu'].

startu_servon :-
	http_server(traktu_peton, [port(8080)]).
