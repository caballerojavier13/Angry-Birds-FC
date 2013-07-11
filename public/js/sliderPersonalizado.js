/**
 * @author Javier Caballero
 */

function show(id){
    document.getElementById(id).style.display="block";
}

function hide(id){
    document.getElementById(id).style.display="none";
}

var activa= 1;
var max;
function showVisorSet(valor, total){
    activa = valor;
    max= total - 1;
    show("visorImagenPantallaCompleta");
    show("imagenPC" + activa);
    hide("page");
}
function hideVisor(){
    hide("visorImagenPantallaCompleta");
    hide("imagenPC" + activa);
    show("page");
}
function tecla (e){
    var evt = e ? e : event;
    var key = window.Event ? evt.which : evt.keyCode;
    if(key == 27){
        hideVisor();
    }else{
        if(key==37){
            prev();
        }else{
            if(key==39){
                next();
            }
        }
    }
    
}
function next(){
    if(activa < max){
        hide("imagenPC" + activa);
        activa = activa + 1 ;
        show("imagenPC" + activa);
    }else{
        hide("imagenPC" + activa);
        activa = 0 ;
        show("imagenPC" + activa);
    }    
}
function prev(){
    if(activa == 0){
        hide("imagenPC" + activa);
        activa = max;
        show("imagenPC" + activa);
    }else{
        hide("imagenPC" + activa);
        activa = activa - 1 ;
        show("imagenPC" + activa);
    }
}
