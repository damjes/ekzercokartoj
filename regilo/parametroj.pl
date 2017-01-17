:- encoding(utf8).

:- use_module(library(http/http_parameters)).

parametroj(id, [atom]).
parametroj(uzanto, [string]).
parametroj(pasvorto, [string]).
parametroj(nomo, [string]).
parametroj(maldekstra, [string]).
parametroj(dekstra, [string]).
parametroj(invitkodo, [string]).

http_parametroj(Kampoj) :-
	http_current_request(Peto),
	http_parameters(Peto, Kampoj, [attribute_declarations(parametroj)]).
