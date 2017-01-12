:- encoding(utf8).

duma(_Peto) :-
	reply_html_page(etoso, [], \enhavo(p(costam))).

ne_ensalutita(_Peto) :-
	reply_html_page(
		etoso,
		title('Saluton!'),
		[
			\fenestreta_formularo(
				ensalutu,
				'/ensalutita',
				'Zaloguj',
				[
					\tekstokampo(text, uzanto, 'Użytkownik'),
					\tekstokampo(password, pasvorto, 'Hasło')
				],
				\sendbutono(primary, ok, 'Zaloguj')
			),
			\fenestreta_formularo(
				registrigu,
				'/',
				'Zarejestruj się',
				[
					\tekstokampo(text, uzanto, 'Użytkownik'),
					\tekstokampo(password, pasvorto, 'Hasło'),
					\tekstokampo(text, invitkodo, 'Kod zaproszenia')
				],
				\sendbutono(success, user, 'Załóż konto')
			),
			\jumbo(
				[
					h1('Witaj!'),
					p('Lorem ipsum dolor sit amet')
				]
			),
			\enhavo(
				[
					div(
						class=row,
						[
							\butono_por_fenestreto(6, 'success', 'log-in', ensalutu, 'Zaloguj'),
							\butono_por_fenestreto(6, 'primary', user, registrigu, 'Załóż konto')
						]
					),
					hr([]),
					footer(
						class='text-center small',
						[
							p(
								[
									'copyleft by ',
									a(href='https://matma6.net/', matma6),
									' 2016-2017 under ',
									a(href='https://www.openhub.net/licenses/m6pl', 'M6PL'),
									'.'
								]
							),
							p(
								[
									'Dumnie wspierane przez ',
									a(href='http://www.swi-prolog.org/', 'SWI-Prolog'),
									'.'
								]
							)
						]
					)
				]
			)
		]
	).

listo_da_vortoj(_Peto) :-
	reply_html_page(
		etoso,
		title('Lista fiszek'),
		[
			\forigjesiga_fenestreto('/ensalutita', 'fiszkę'),
			\jumbo(
				[
					h1('Kartoteka: Rumuński A1'),
					h2('Lista fiszek')
				]
			),
			\enhavo(
				[
					\karttabelo(
						[
							karto(kapusta, 'varză'),
							karto(kurczak, pui),
							karto(mysz, 'șoarece')
						]
					),
					\butono(
						info,
						'/ensalutita',
						\bildeto_teksto('chevron-left', 'Wróć do listy fiszek')
					),
					\malplena_vico,
					\butono(
						warning,
						/,
						\bildeto_teksto('log-out', 'Wyloguj')
					)
				]
			)
		]
	).

listo_da_kartaroj(_Peto) :-
	reply_html_page(
		etoso,
		title('Lista kartotek'),
		[
			\forigjesiga_fenestreto('/ensalutita', 'kartotekę'),
			\jumbo(h1('Lista kartotek')),
			\enhavo(
				[
					\kartartabelo(
						[
							'Rumuński A1',
							'Esperanto A1'
						]
					),
					\vico(
						\butono_por_fenestreto(12, success, plus, nova, 'Nowa kartoteka')
					),
					\malplena_vico,
					\butono(
						warning,
						/,
						\bildeto_teksto('log-out', 'Wyloguj')
					)
				]
			)
		]
	).

demando(_Peto) :-
	reply_html_page(
		etoso,
		title('Kartoteka: Rumuński A1'),
		[
			\jumbo(h1('Rumuński A1')),
			\enhavo(
				[
					\well('brânză'),
					\well(\respondo),
					\butono(
						success,
						'/respondo',
						\bildeto_teksto(ok, 'Pokaż odpowiedź')
					),
					\malplena_vico,
					\butono(
						danger,
						'/ensalutita',
						\bildeto_teksto(remove, 'Zakończ podejście')
					)
				]
			)
		]
	).

respondo(_Peto) :-
	reply_html_page(
		etoso,
		title('Kartoteka: Rumuński A1'),
		[
			\jumbo(h1('Rumuński A1')),
			\enhavo(
				[
					\demanda_well('brânză'),
					\responda_well(baca, ser),
					\vico(
						[
							\largha_butono(3, primary, /, 'Bardzo dobrze'),
							\largha_butono(3, success, /, 'Dobrze'),
							\largha_butono(3, warning, /, 'Słabo'),
							\largha_butono(3, danger, /, 'Źle')
						]
					),
					\malplena_vico,
					\butono(
						danger,
						'/ensalutita',
						\bildeto_teksto(remove, 'Zakończ podejście')
					)
				]
			)
		]
	).
