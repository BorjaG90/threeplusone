/**
  * Created by Borja Gete on 24/04/17.
  */
function mostrar(){
document.getElementById('shot-chart').style.display = 'block';}

function ocultar(){
document.getElementById('shot-chart').style.display = 'none';}

function calculatePercentage(idMade,idAtt,min,max,idSvg){
    var made = document.getElementById(idMade).value;
    var att = document.getElementById(idAtt).value;
    var r = (made / att) * 100;
     if(r <= min && r < 101){
        document.getElementById(idSvg).className.baseVal = "zone bad-fg";
    }else if(r>= max && r < 101){
        document.getElementById(idSvg).className.baseVal = "zone good-fg";
    }else{
        document.getElementById(idSvg).className.baseVal = "zone neutral-fg";
    }
}