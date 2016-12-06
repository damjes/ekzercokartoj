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

kartaro(L) -->
	html(
		tr(
			[
				td(L),
				td(
					a(
						href='/demando',
						\bildeto('eye-open')
					)
				),
				td(
					a(
						href='kartaro',
						\bildeto(pencil))
					)
			]
		)
	).

listo_da_kartaroj([]) --> [].
listo_da_kartaroj([K|Koj]) -->
	html(
		[
			\kartaro(K),
			\listo_da_kartaroj(Koj)
		]
	).

kartartabelo(Koj) -->
	html(
		table(
			class=table,
			[
				tr(
					[
						th('Nazwa'),
						th('Sprawdź'),
						th('Edytuj')
					]
				),
				\listo_da_kartaroj(Koj)
			]
		)
	).

jumbo(Internajho) -->
	html(
		div(class=jumbotron,
			div(class=container, Internajho)
		)
	).

well(Internajho) -->
	html(
		div(
			class='well well-lg',
			Internajho
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
			div(class='col-md-6', \butono('success', '/ensalutita', 'Zaloguj')),
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
			\butono(info, '/ensalutita', 'Wróć do listy fiszek'),
			\butono(warning, /, 'Wyloguj')
		]
	).

listo_da_kartaroj(_Peto) :-
	reply_html_page(
		etoso,
		title('Lista kartotek'),
		[
			\jumbo(h1('Lista kartotek')),
			\kartartabelo(
				[
					'Rumuński A1',
					'Esperanto A1'
				]
			),
			\butono(warning, /, 'Wyloguj')
		]
	).

demando(_Peto) :-
	reply_html_page(
		etoso,
		title('Kartoteka: Rumuński A1'),
		[
			\jumbo(h1('Rumuński A1')),
			\well('brânză'),
			\butono(info, '/respondo', 'Pokaż odpowiedź')
		]
	).

respondo(_Peto) :-
	reply_html_page(
		etoso,
		title('Kartoteka: Rumuński A1'),
		[
			\jumbo(h1('Rumuński A1')),
			\well('brânză'),
			\well(ser),
			\butono(info, '/respondo', 'Przyciski'),
			\butono(info, '/respondo', 'Przyciski')
		]
	).
