/*$('#exampleModal').on('show.bs.modal', function (event) {
	var button = $(event.relatedTarget) // Button that triggered the modal
	var recipient = button.data('whatever') // Extract info from data-* attributes
	// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	var modal = $(this)
	modal.find('.modal-title').text('New message to ' + recipient)
	modal.find('.modal-body input').val(recipient)
})*/

$( document ).ready(function() {
	$('#forigu').on('show.bs.modal', function(event) {
		var fonto = $(event.relatedTarget) // klakita butono
		var id_por_forigi = fonto.data('id')
		var nomo_por_forigi = fonto.data('nomo')

		var fenestreto = $(this)
		fenestreto.find('#id_por_forigi').val(id_por_forigi)
		fenestreto.find('#nomo_por_forigi').text(nomo_por_forigi)
	})
});
