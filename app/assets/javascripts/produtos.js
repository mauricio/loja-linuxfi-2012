jQuery( function($) {

   $("form.add_to_cart_form").submit( function(e) {

       e.preventDefault();

       var form = $(this);
       var formData = form.serialize();
       var submit = form.find(".btn-primary");
       var previous = submit.val();

       submit.val("Enviando...");

       $.post(
           form.attr("action"),
           formData,
           function( data ) {
             submit.val(previous);
             alert("Produto adicionado com sucesso!");
           },
           "json"
       );

   } );

} );