:- encoding(utf8).

enhavo(E) -->
	html(
		div(
			class=container,
			E
		)
	).

vico(Enhavo) -->
	html(
		div(class=row, Enhavo)
	).

malplena_vico -->
	html(
		\vico(&(nbsp))
	).

bildeto(Nomo) -->
	html(
		span(class='glyphicon glyphicon-'+Nomo, [])
	).

bildeto_teksto(Bildeto, Teksto) -->
	html(
		[
			\bildeto(Bildeto),
			&(nbsp),
			Teksto
		]
	).

jumbo(Internajho) -->
	html(
		div(class=jumbotron,
			div(class=container, Internajho)
		)
	).

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

largha_butono(Largheco, Klaso, Ligilo, Teksto) -->
	html(
		div(
			class='col-sm-'+Largheco,
			\butono(Klaso, Ligilo, Teksto)
		)
	).

tekstokampo(Tipo, ID, Priskribo) -->
	html(
		\plenigita_tekstokampo(Tipo, ID, Priskribo, [])
	).

plenigita_tekstokampo(Tipo, ID, Priskribo, Enhavo) -->
	html(
		div(
			class='form-group',
			[
				label(
					for=ID,
					[
						Priskribo,
						':'
					]),
				input(
					[
						class='form-control',
						id=ID,
						name=ID,
						placeholder=Priskribo,
						type=Tipo,
						value=Enhavo
					]
				)
			]
		)
	).

sendbutono(Klaso, Bildeto, Teksto) -->
	html(
		button(
			[
				class='btn btn-'+Klaso,
				type=submit
			],
			\bildeto_teksto(Bildeto, Teksto)
		)
	).
