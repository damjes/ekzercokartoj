:- use_module(library(http/http_dispatch)).

:- http_handler(/, ne_ensalutita, []).
:- http_handler('/kartaro', listo_da_vortoj, []).
:- http_handler('/ensalutita', listo_da_kartaroj, []).
:- http_handler('/demando', demando, []).
:- http_handler('/respondo', respondo, []).