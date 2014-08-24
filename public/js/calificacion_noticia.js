$("#star1").hover(
    function () {
        $("#star1").attr("src", "/picture/icon/star.png");
    },
    function () {
        $("#star1").attr("src", "/picture/icon/star2.png");
    }
);
$("#star2").hover(
    function () {
        $("#star1").attr("src", "/picture/icon/star.png");
        $("#star2").attr("src", "/picture/icon/star.png");
    },
    function () {
        $("#star1").attr("src", "/picture/icon/star2.png");
        $("#star2").attr("src", "/picture/icon/star2.png");
    }
);
$("#star3").hover(
    function () {
        $("#star1").attr("src", "/picture/icon/star.png");
        $("#star2").attr("src", "/picture/icon/star.png");
        $("#star3").attr("src", "/picture/icon/star.png");
    },
    function () {
        $("#star1").attr("src", "/picture/icon/star2.png");
        $("#star2").attr("src", "/picture/icon/star2.png");
        $("#star3").attr("src", "/picture/icon/star2.png");
    }
);
$("#star1").click(function(){
    $("#star").hide();
    $("#msj_califi").html("Calificando...")
    $("#msj_califi").show();
    $.post("/calificacion/<%=@noticium.id.to_s%>/nueva", {valor:1},
        function(data){
            $("#msj_califi").html("Gracias por su calificación.");
            $.timer(5000, function(){
                $("#star1c").attr("src", "/picture/icon/star.png");
                $("#calificacion").show();
                $("#msj_califi").hide();
            });
        });
});
$("#star2").click(function(){
    $("#star").hide();
    $("#msj_califi").html("Calificando...")
    $("#msj_califi").show();
    $.post("/calificacion/<%=@noticium.id.to_s%>/nueva", {valor:2},
        function(data){
            $("#msj_califi").html("Gracias por su calificación.");
            $.timer(5000, function(){
                $("#star1c").attr("src", "/picture/icon/star.png");
                $("#star2c").attr("src", "/picture/icon/star.png");
                $("#calificacion").show();
                $("#msj_califi").hide();
            });
        });
});
$("#star3").click(function(){
    $("#star").hide();
    $("#msj_califi").html("Calificando...")
    $("#msj_califi").show();
    $.post("/calificacion/<%=@noticium.id.to_s%>/nueva", {valor:3},
        function(data){
            $("#msj_califi").html("Gracias por su calificación.");
            $.timer(5000, function(){
                $("#star1c").attr("src", "/picture/icon/star.png");
                $("#star2c").attr("src", "/picture/icon/star.png");
                $("#star3c").attr("src", "/picture/icon/star.png");
                $("#calificacion").show();
                $("#msj_califi").hide();
            });
        });
});