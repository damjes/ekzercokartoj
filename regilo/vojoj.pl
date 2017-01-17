:- encoding(utf8).

:- use_module(library(arouter)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_files)).

traktu_peton(Peto):-
	(
		route(Peto)
	->
		true
	;
		http_dispatch(Peto)
	).

:- route_get(/, ensalutita(listo_da_kartaroj)).
:- route_get(elsalutu, elsalutu).
:- route_get(kartaro/ID, listo_da_vortoj(ID)).

:- route_post(/, ensalutu(listo_da_kartaroj)).
:- route_post(forigu_kartaron, forigu_kartaron).
:- route_post(nova_kartaro, kreu_kartaron).
:- route_post(nova_konto, kreu_konton).

:- http_handler('/statika/', http_reply_from_files('statika', []), [prefix]).
:- http_handler('/sencimigu', sencimigu, [prefix]).
