:- encoding(utf8).

well(Internajho) -->
	html(
		div(
			class='well well-lg',
			Internajho
		)
	).

demanda_well(Demando) -->
	html(
		\well(p(Demando))
	).

responda_well(Malbona, Bona) -->
	html(
		\well(
			[
				h4('Twoja odpowiedź:'),
				p(Malbona),
				h4('Poprawna odpowiedź:'),
				p(Bona)
			]
		)
	).

respondo -->
	html(
		div(
			class='form-group',
			input(
				[
					type=text,
					class='form-control',
					id=respondo,
					placeholder='Twoja odpowiedź'
				],
				[]
			)
		)
	).
