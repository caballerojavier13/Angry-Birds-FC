function inicio() {
  document.getElementById("loading").style.display="none";
  document.getElementById("page").style.display="block";
    var hash = window.location.hash;
    if(hash !== undefined){
        $('#new_comment').affix({});
    }
}
