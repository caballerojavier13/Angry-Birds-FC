
function show(id){
    document.getElementById(id).style.display="block";
}

function hide(id){
    document.getElementById(id).style.display="none";
}


function pantallaCompleta(){
    hide("page");
    show("pantallaCompleta");
}
function salirPantallaCompleta(){
    show("page")
    hide("pantallaCompleta");
}

function tecla (e){
    var evt = e ? e : event;
    var key = window.Event ? evt.which : evt.keyCode;
    if(key == 27){
        salirPantallaCompleta();
    }    
}
