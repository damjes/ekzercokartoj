:- use_module(library(http/http_dispatch)).

:- http_handler(/, ne_ensalutita, []).
:- http_handler('/kartaro', listo_da_vortoj, []).
