:- use_module(library(http/html_write)).

:- [kapo].

user:body(etoso, Korpo) -->
	html(body(div(class=container, Korpo))).

butono(Klaso, Ligilo, Teksto) -->
	html(
		a(
			[
				class='btn btn-block btn-lg btn-'+Klaso,
				role=button,
				href=Ligilo
			],
			Teksto
		)
	).

bildeto(Nomo) -->
	html(
		span(class='glyphicon glyphicon-'+Nomo, [])
	).

karto(Md, D) -->
	html(
		tr(
			[
				td(Md),
				td(D),
				td(\bildeto(pencil)),
				td(\bildeto(remove))
			]
		)
	).

kartoj([]) --> [].
kartoj([karto(Md, D)| Koj]) -->
	html(
		[
			\karto(Md, D),
			\kartoj(Koj)
		]
	).
karttabelo(Listo) -->
	html(
		table(
			class=table,
			[
				tr(
					[
						th('Lewa strona'),
						th('Prawa strona'),
						th('Edytuj'),
						th('Usuń')
					]
				),
				\kartoj(Listo)
			]
		)
	).

jumbo(Internajho) -->
	html(
		div(class=jumbotron,
			div(class=container, Internajho)
		)
	).

duma(_Peto) :-
	reply_html_page(etoso, [], p(costam)).

ne_ensalutita(_Peto) :-
	reply_html_page(
		etoso,
		title('Saluton!'),
		[
			\jumbo(
				[
					h1('Witaj!'),
					p('Lorem ipsum dolor sit amet')
				]
			),
			div(class='col-md-6', \butono('success', '/kartaro', 'Zaloguj')),
			div(class='col-md-6', \butono('primary', '#', 'Załóż konto'))
		]
	).

listo_da_vortoj(_Peto) :-
	reply_html_page(
		etoso,
		title('Lista fiszek'),
		[
			\jumbo(
				[
					h1('Kartoteka: kartaro'),
					h2('Lista fiszek')
				]
			),
			\karttabelo(
				[
					karto(kapusta, 'varză'),
					karto(kurczak, pui),
					karto(mysz, 'șoarece')
				]
			),
			\butono(info, /, 'Wróć do listy fiszek'),
			\butono(warning, /, 'Wyloguj')
		]
	).
