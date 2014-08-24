function callback(){
    $(".botonera").show();
    $(".loader").hide();
}
$(".botonera .b1").click(function(){
    $(".botonera").hide();
    $(".loader").show();
    $.ajax({
        type: "GET",
        url: "/admin/permisos/add_all_function",
        data: { role: $('#rol').val()}
    })
    .done(function() {
        var listado = $(".c2 li");
        var count = listado.length;
        listado.each(function(index, element){
            var id = $(element).attr('id');
            var texto = $(element).html();
            $(element).remove();
            $(".c1").append("<li id='"+ id + "'>" + texto + "</li>");
            if (!--count) callback();
        });
    });
});
$(".botonera .b2").click(function(){
    $(".botonera").hide();
    $(".loader").show();
    var listado = $(".c2").find(".ui-selected");
    var count = listado.length;
    if(count < 1) callback();
   listado.each(function(index, element){
       $.ajax({
           type: "GET",
           url: "/admin/permisos/add_one_function",
           data: { role: $('#rol').val(), function: $(element).attr('id').substring(4)}
       })
       .done(function() {
           var id = $(element).attr('id');
           var texto = $(element).html();
           $(element).remove();
           $(".c1").append("<li id='"+ id + "'>" + texto + "</li>");
           if (!--count) callback();
        });
    });
});
$(".botonera .b3").click(function(){
    $(".botonera").hide();
    $(".loader").show();
    var listado = $(".c1").find(".ui-selected");
    var count = listado.length;
    if(count < 1) callback();
    listado.each(function(index, element){
        $.ajax({
            type: "GET",
            url: "/admin/permisos/remove_one_function",
            data: { role: $('#rol').val(), function: $(element).attr('id').substring(4)}
        })
        .done(function() {
            var id = $(element).attr('id');
            var texto = $(element).html();
            $(element).remove();
            $(".c2").append("<li id='"+ id + "'>" + texto + "</li>");
            if (!--count) callback();
        });
    });
});
$(".botonera .b4").click(function(){
    $(".botonera").hide();
    $(".loader").show();
    $.ajax({
        type: "GET",
        url: "/admin/permisos/remove_all_function",
        data: { role: $('#rol').val()}
    })
    .done(function() {
        var listado = $(".c1 li");
        var count = listado.length;
        if(count < 1) callback();
        listado.each(function(index, element){
            var id = $(element).attr('id');
            var texto = $(element).html();
            $(element).remove();
            $(".c2").append("<li id='"+ id + "'>" + texto + "</li>");
            if (!--count) callback();
        });
    });
});

$('#rol').change(function(){
    $(".botonera").hide();
    $(".loader").show();
    $.ajax({
        type: "GET",
        url: "/admin/permisos/change_rol",
        data: { role: $('#rol').val()}
    })
    .done(function() {
            $(".botonera").show();
            $(".loader").hide();
    });
});
