:- encoding(utf8).

kartaro(L) -->
	html(
		tr(
			[
				td(L),
				td(
					a(
						href='/demando',
						\bildeto('play-circle')
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
						[],
						forigu,
						\bildeto(remove)
					)
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
						th('Edytuj'),
						th('Usuń')
					]
				),
				\listo_da_kartaroj(Koj)
			]
		)
	).
