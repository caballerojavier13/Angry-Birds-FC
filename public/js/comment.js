var comentario;
var comentario_html;
var comentario_id = 0;
var otra_vez = 0;

function editComment(id, usuario){

    var html_edit = '<div id="edit_comment" style="position: relative;width: 80%; left:10%">' +
        '<textarea style="margin-top: 20px;margin-bottom: 40px; width: 100%; height: 200px;padding: 20px; font-family: Times New Roman; font-size:20px;background: none; border-radius: 5px; box-shadow: inset 0 0 10px black;border:none;"> </textarea>' +
        '<a onclick="cancel_editComment()" style="position: absolute; top: 270px; right: 150px;color: yellow;font-size: 22px; line-height: 30px; text-shadow: 0 0 5px black;">Cancelar</a>' +
        '<button onclick="clic_button_edit( ' + id + ', ' + usuario + ' )" onmouseover="over_button_edit()" onmouseout="out_button_edit()" onmousedown="down_button_edit()" onmouseup="up_button_edit()" style="position: absolute; top: 270px; right: 20px; height: 30px; border-radius: 5px; box-shadow: 0 0 8px black; color: white; text-shadow: 0 0 1px black; cursor: pointer; font-family: angrybirds; font-size: 22px; background: none; border: solid 1px yellow; padding-left: 10px; padding-right: 10px;">Guardar</button>' +
        '</div>';

    if(id != comentario_id){
        otra_vez = 0;
        if(typeof comentario_id != 'undefined'){
            $("#edit_comment").replaceWith("<div class='text_comment'>" + comentario_html + "</div>");
        }
        comentario = $("#comment_" + id).children('.text_comment').text();
        comentario_html = $("#comment_" + id).children('.text_comment').html();
        comentario_id = id;


        $("#comment_" + id).children('.text_comment').replaceWith( html_edit);

        $("#edit_comment textarea").val(comentario);

    }else{
        if(otra_vez > 0){
            comentario = $("#comment_" + id).children('.text_comment').text();
            comentario_html = $("#comment_" + id).children('.text_comment').html();
            comentario_id = id;

            $("#comment_" + id).children('.text_comment').replaceWith( html_edit);

            $("#edit_comment textarea").val(comentario);

            otra_vez = 0;
        }else{
            $("#edit_comment").replaceWith( "<div class='text_comment'>" + comentario_html + "</div>");
            otra_vez = 1;
        }

    }
    $("body").trigger('create');
    return false;
}

function clic_button_edit(id, usuario){
    comentario = $("#edit_comment textarea").val();
     $("#edit_comment").replaceWith("<img id='#loading_edit_comment' src='/picture/gif_loading/3.gif' style='position: relative;margin-top: 30px; left:50%; margin-left: -240px; opacity: 1; border-radius:3px;' alt='' >");
    var request = $.ajax({
        url: "/comments/" + id + "?usuario=" + usuario + '&cuerpo=' + encodeURIComponent(comentario) ,
        type: "PUT",
        contentType: 'application/json; charset=utf-8'
    });
    request.done(function(msg) {

    });
    request.fail(function(jqXHR, textStatsoundsus) {

    });
    return false;
}

function up_button_edit(){
    $("#edit_comment button").css({"box-shadow": "0 0 4px black"});
}

function down_button_edit(){
    $("#edit_comment button").css({"box-shadow": "0 0 2px black"});
}

function over_button_edit(){
    $("#edit_comment button").css({"box-shadow": "0 0 6px black"});
}
function out_button_edit(){
    $("#edit_comment button").css({"box-shadow": "0 0 8px black"});
}

function cancel_editComment(){
    $("#edit_comment").replaceWith(  "<div class='text_comment'>" + comentario_html + "</div>");
    otra_vez = 1;
}
function deleteComment(id , usuario){
    //alert("Corregir eliminacion");
    var request = $.ajax({
        url: "/comments/" + id + "?usuario=" + usuario,
        type: "DELETE",
        contentType: 'charset=utf-8'
    });
    request.done(function(msg) {

    });
    request.fail(function(jqXHR, textStatsoundsus) {

    });
    return false;
}


$("form").submit(function (e) {
    e.preventDefault();
    var serializedForm = $("#text_area_comment").val();//Obtienes los campos del formulario
    $("#form_comment textarea").val('');
    $("#form_comment").hide();
    $("#comment_loading").show();
    url = $("#form_comment").attr( 'action' );//obtiene el url declarado en el form en la propiedad action

    $.post(url, {text_area_comment: serializedForm},
    function(data){
        $("#form_comment").show();
        $("#comment_loading").hide();
    });
    return false;
});

$(function(){
    $("#boton_comment").prop('disabled', true);
    $("#text_area_comment").bind('input propertychange', function() {
        if($('#text_area_comment').val().length > 0){
            $("#boton_comment").prop('disabled', false);
        }else{
            $("#boton_comment").prop('disabled', true);
        }
    });
});


$('.icon_edit_comment').tooltip({container: 'body'});
$('.delete_comment').tooltip({container: 'body'});
