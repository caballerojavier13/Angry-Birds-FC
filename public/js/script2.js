function show(id){
    document.getElementById(id).style.display="block";
}

function hide(id){
    document.getElementById(id).style.display="none";
}

function hideVisor(){
  show("page");
  hide("visorVideoPantallaCompleta");  
}
function showVisor () {
  hide("page");
  show("visorVideoPantallaCompleta");
}
