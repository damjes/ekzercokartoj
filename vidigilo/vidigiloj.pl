:- encoding(utf8).

ne_ensalutita :-
	reply_html_page(
		etoso,
		title('Saluton!'),
		[
			\fenestreta_formularo(
				ensalutu,
				'/',
				'Zaloguj',
				[
					\tekstokampo(text, uzanto, 'Użytkownik'),
					\tekstokampo(password, pasvorto, 'Hasło')
				],
				\sendbutono(primary, ok, 'Zaloguj')
			),
			\fenestreta_formularo(
				registrigu,
				'/nova_konto',
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
					)
				]
			)
		]
	).

listo_da_vortoj(Kartaro) :-
	findall(karto(ID, Maldekstra, Dekstra), karto(ID, Kartaro, Maldekstra, Dekstra, _), Kartoj),
	reply_html_page(
		etoso,
		title('Lista fiszek'),
		[
			\forigjesiga_fenestreto('/ensalutita', 'fiszkę'),
			\fenestreta_formularo(
				alinomu,
				'/ensalutita',
				'Zmień nazwę',
				\plenigita_tekstokampo(
					text,
					nomo,
					'Nazwa',
					'stara nazwa'
				),
				\sendbutono(
					primary,
					pencil,
					'Zmień nazwę'
				)
			),
			\fenestreta_formularo(
				redaktu,
				'/kartaro',
				'Edytuj fiszkę',
				[
					\tekstokampo(
						text,
						maldekstra,
						'Lewa strona'
					),
					\tekstokampo(
						text,
						dekstra,
						'Prawa strona'
					),
					\kashita_id_kampo
				],
				\sendbutono(
					primary,
					pencil,
					'Edytuj'
				)
			),
			\fenestreta_formularo(
				aldonu,
				'/kartaro',
				'Dodaj fiszkę',
				[
					\tekstokampo(
						text,
						maldekstra,
						'Lewa strona'
					),
					\tekstokampo(
						text,
						dekstra,
						'Prawa strona'
					)
				],
				\sendbutono(
					success,
					plus,
					'Dodaj'
				)
			),
			\jumbo(
				h1(
					'Kartoteka: Rumuński A1'
				)
			),
			\enhavo(
				[
					\vico(
						[
							\butono_por_fenestreto(
								6,
								primary,
								pencil,
								alinomu,
								'Zmień nazwę kartoteki'
							),
							\butono_por_fenestreto(
								6,
								success,
								plus,
								alinomu,
								'Dodaj fiszkę'
							)
						]
					),
					\malplena_vico,
					h2('Lista fiszek'),
					\karttabelo(Kartoj),
					\vico(
						[
							\largha_butono(
								6,
								info,
								'/ensalutita',
								\bildeto_teksto('chevron-left', 'Wróć')
							),
							\largha_butono(
								6,
								success,
								'/demando',
								\bildeto_teksto(play, 'Sprawdź')
							)
						]
					),
					\malplena_vico,
					\butono(
						warning,
						'/elsalutu',
						\bildeto_teksto('log-out', 'Wyloguj')
					)
				]
			)
		]
	).

listo_da_kartaroj :-
	http_session_data(uzanto(Uzanto)),
	findall(kartaro(ID, Kartaro), kartaro(ID, Uzanto, Kartaro), Kartaroj),
	reply_html_page(
		etoso,
		title('Lista kartotek'),
		[
			\forigjesiga_fenestreto('/ensalutita', 'kartotekę'),
			\fenestreta_formularo(
				nova,
				'/ensalutita',
				'Nowa kartoteka',
				\tekstokampo(text, nomo, 'Nazwa kartoteki'),
				\sendbutono(success, plus, 'Dodaj')
			),
			\jumbo(h1('Lista kartotek')),
			\enhavo(
				[
					\kartartabelo(Kartaroj),
					\vico(
						\butono_por_fenestreto(12, success, plus, nova, 'Nowa kartoteka')
					),
					\malplena_vico,
					\butono(
						warning,
						'/elsalutu',
						\bildeto_teksto('log-out', 'Wyloguj')
					)
				]
			)
		]
	).

demando :-
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

respondo :-
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
