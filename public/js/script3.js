var SizeTotal = 0;

function show(id){
    document.getElementById(id).style.display="block";
}

function hide(id){
    document.getElementById(id).style.display="none";
}

for (var i=0; i < size; i++) {
    hide("proyector"+i);
  };
  
function hideVisor(){
  show("body");
  hide("visorVideoPantallaCompleta");
    
}
function showVisor(id , size) {
  hide("body");
  for (var i=0; i < size; i++) {
    hide("proyector"+i);
  };
  show("proyector"+id);
  show("visorVideoPantallaCompleta");
  
}


function tecla (e){
    var evt = e ? e : event;
    var key = window.Event ? evt.which : evt.keyCode;
    if(key == 27){
        hideVisor();
    }
}