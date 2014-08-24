
function show(id){
    document.getElementById(id).style.display="block";
}

function hide(id){
    document.getElementById(id).style.display="none";
}

function tooltip(id){
    contenedor= document.getElementById("list_opc");
    if((parseInt(contenedor.style.height)) > 198){
        alert("arriba");
    }
    show(id);
}

function showLogin(){
	show('contenido');
	show('form');
}
function hideLogin(){
	hide('contenido');
	hide('form');
}