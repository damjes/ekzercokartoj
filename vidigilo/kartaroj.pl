:- encoding(utf8).

kartaro(ID, Nomo) -->
	html(
		tr(
			[
				td(Nomo),
				td(
					a(
						href='/demando',
						\bildeto(play)
					)
				),
				td(
					a(
						href='kartaro',
						\bildeto(pencil)
					)
				),
				td(
					\ligilo_por_fenestreto(
						[
							'data-id'=ID,
							'data-nomo'=Nomo
						],
						forigu,
						\bildeto(trash)
					)
				)
			]
		)
	).

listo_da_kartaroj([]) --> [].
listo_da_kartaroj([kartaro(ID, Nomo)|Koj]) -->
	html(
		[
			\kartaro(ID, Nomo),
			\listo_da_kartaroj(Koj)
		]
	).

kartartabelo(Koj) -->
	html(
		table(
			class='table table-hover',
			[
				tr(
					class='hidden-xs',
					[
						th('Nazwa'),
						th('Sprawdź'),
						th('Edytuj'),
						th('Usuń')
					]
				),
				\listo_da_kartaroj(Koj)
			]
		)
	).
