:- encoding(utf8).

ligilo_por_fenestreto(Datumoj, FenestretaID, Enhavo) -->
	html(
		a(
			[
				'data-target'="#"+FenestretaID,
				'data-toggle'=modal,
				href='#'
			|
				Datumoj
			],
			Enhavo
		)
	).

butono_por_fenestreto(Largheco, Klaso, Bildeto, FenestretaID, Teksto) -->
	html(
		div(
			class='col-sm-'+Largheco,
			button(
				[
					class='btn btn-block btn-lg btn-'+Klaso,
					'data-target'="#"+FenestretaID,
					'data-toggle'=modal,
					type=button
				],
				\bildeto_teksto(Bildeto, Teksto)
			)
		)
	).
