:- use_module(library(http/html_write)).

:- [kapo].

user:body(etoso, Korpo) -->
	html(body(div(class=container, Korpo))).

butono(Klaso, Ligilo, Teksto) -->
	html(
		a(
			[
				class='btn btn-block btn-lg '+Klaso,
				role=button,
				href=Ligilo
			],
			Teksto
		)
	).

duma(_Peto) :-
	reply_html_page(etoso, [], p(costam)).

ne_ensalutita(_Peto) :-
	reply_html_page(
		etoso,
		[title('Saluton!')],
		[
			div(class=jumbotron,
				div(class=container,
					[
						h1('Witaj!'),
						p('Lorem ipsum dolor sit amet')
					]
				)
			),
			div(class='col-md-6', \butono('btn-success', '#', 'Zaloguj')),
			div(class='col-md-6', \butono('btn-primary', '#', 'Załóż konto'))
		]
	).
