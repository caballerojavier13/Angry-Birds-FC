
(function($) {
    $.get = function(key)   {
        key = key.replace(/[\[]/, '\\[');
        key = key.replace(/[\]]/, '\\]');
        var pattern = "[\\?&]" + key + "=([^&#]*)";
        var regex = new RegExp(pattern);
        var url = unescape(window.location.href);
        var results = regex.exec(url);
        if (results === null) {
            return null;
        } else {
            return results[1];
        }
    }
})(jQuery);

function to_bolean(string){
    if(string == "true"){
        return true;
    }else{
        return false;
    }

}
$(function(){
    $("#persona_nombre").val($.get("nom"));
    $("#persona_apellido").val($.get("ape"));
    $("#persona_username").val($.get("user"));
    $("#persona_mail").val($.get("mail"));
    $("#activo-check").prop('checked', to_bolean($.get("act")));
    $("#bloqueado-check").prop('checked', to_bolean($.get("bloq")));
    $("#persona_role").val($.get("role"));
});
$("#filtro_busq_boton").click(function(){
    $("#filtro_busq").toggle("blind");
    $("#filtro_busq_boton").toggleClass("filtro_busq_boton_hide");
    $("#filtro_busq_boton").toggleClass("filtro_busq_boton_show");
    var texto = $("#filtro_busq_boton").html();
    if(texto == "Mostrar Filtros"){
        $("#filtro_busq_boton").html("Ocultar Filtros");
    }else{
        $("#filtro_busq_boton").html("Mostrar Filtros");
    }
});
$("#boton_buscar").click(function(){
    var nom = encodeURI($("#persona_nombre").val());
    var ape = encodeURI($("#persona_apellido").val());
    var user = encodeURI($("#persona_username").val());
    var mail = encodeURI($("#persona_mail").val());
    var act = $("#activo-check").prop('checked');
    var bloq = $("#bloqueado-check").prop('checked');
    var role = $("#persona_role").val();
    var url = "/admin/usuarios?nom="+nom+"&ape="+ape+"&user="+user+"&mail="+mail+"&act="+act+"&bloq="+bloq+"&role="+role ;
    $(location).attr('href',url)
});
$("#boton_all").click(function(){
    $(location).attr('href',"/admin/usuarios")
});