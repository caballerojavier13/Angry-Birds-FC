$(".circulo").click(function(){
    $("#notif_min").toggle(500);
    $("#notif_max").toggle(500);
});
$(function(){
    $.timer(30000, function(){
        url = "/nuevas_notificaciones"
        $.get(url, null,
            function(data){
                if(parseInt($("#notif_min").html()) == '0'){
                    $("#notificacion").hide();
                }else{
                    $("#notificacion").show();
                    if(parseInt($("#notif_min").html()) > 20){
                        $('#notif_min').html("+20");
                    }
                }
            });
        return false;
    });
});
$(function(){
    if(parseInt($("#notif_min").html()) == 0){
        $("#notificacion").hide();
    }else{
        $("#notificacion").show();
        if(parseInt($("#notif_min").html()) > 20){
            $('#notif_min').html("+20");
        }
    }
});