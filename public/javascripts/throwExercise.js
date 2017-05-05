/**
  * Created by Borja Gete on 24/04/17.
  */
function mostrar(serieId){
document.getElementById('shot-chart').style.display = 'block';
document.getElementById('id_serie_shot').value = serieId;}

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
    var madeDown = idMade + "-down"
    var attDown = idAtt + "-down"
    document.getElementById(madeDown).value=made;
    document.getElementById(attDown).value=att;
}
function setInShotChart(id){
    var value = document.getElementById(id+ "-down").value;
    document.getElementById(id).value=value;
    document.getElementById(id).onchange();
}
/*function saveShots{
    var serieId = document.getElementById("id_serie_shot").value
    alert(serieId);
    var shots=[];
    if(!!document.getElementById("left-wing-fgm").value && !!document.getElementById("left-wing-fga").value){
          var zone = [];
          zone.push([serieID,"left-wing-fgm",document.getElementById("left-wing-fgm").value]);
          zone.push([serieID,"left-wing-fga",document.getElementById("left-wing-fga").value]);
          shots.push(zone);
    }
    if(!!document.getElementById("right-wing-fgm").value && !!document.getElementById("right-wing-fga").value){
        var zone = [];
        zone.push([serieID,"right-wing-fgm",document.getElementById("right-wing-fgm").value]);
        zone.push([serieID,"right-wing-fga",document.getElementById("right-wing-fga").value]);
        shots.push(zone);
    }
    if(!!document.getElementById("rim-fgm").value && !!document.getElementById("rim-fga").value){
        var zone = [];
        zone.push([serieID,"rim-fgm",document.getElementById("rim-fgm").value]);
        zone.push([serieID,"rim-fga",document.getElementById("rim-fga").value]);
        shots.push(zone);
    }
    if(!!document.getElementById("high-post-left-fgm").value && !!document.getElementById("high-post-left-fga").value){
        var zone = [];
        zone.push([serieID,"high-post-left-fgm",document.getElementById("high-post-left-fgm").value]);
        zone.push([serieID,"high-post-left-fga",document.getElementById("high-post-left-fga").value]);
        shots.push(zone);
    }
    if(!!document.getElementById("high-post-right-fgm").value && !!document.getElementById("high-post-right-fga").value){
        var zone = [];
        zone.push([serieID,"high-post-right-fgm",document.getElementById("high-post-right-fgm").value]);
        zone.push([serieID,"high-post-right-fga",document.getElementById("high-post-right-fga").value]);
        shots.push(zone);
    }
    if(!!document.getElementById("high-post-center-fgm").value && !!document.getElementById("high-post-center-fga").value){
        var zone = [];
        zone.push([serieID,"high-post-center-fgm",document.getElementById("high-post-center-fgm").value]);
        zone.push([serieID,"high-post-center-fga",document.getElementById("high-post-center-fga").value]);
        shots.push(zone);
    }
    if(!!document.getElementById("low-post-left-fgm").value && !!document.getElementById("low-post-left-fga").value){
        var zone = [];
        zone.push([serieID,"low-post-left-fgm",document.getElementById("low-post-left-fgm").value]);
        zone.push([serieID,"low-post-left-fga",document.getElementById("low-post-left-fga").value]);
        shots.push(zone);
    }
    if(!!document.getElementById("low-post-center-fgm").value && !!document.getElementById("low-post-center-fga").value){
        var zone = [];
        zone.push([serieID,"low-post-center-fgm",document.getElementById("low-post-center-fgm").value]);
        zone.push([serieID,"low-post-center-fga",document.getElementById("low-post-center-fga").value]);
        shots.push(zone);
    }
    if(!!document.getElementById("low-post-center-left-fgm").value && !!document.getElementById("low-post-center-left-fga").value){
        var zone = [];
        zone.push([serieID,"low-post-center-left-fgm",document.getElementById("low-post-center-left-fgm").value]);
        zone.push([serieID,"low-post-center-left-fga",document.getElementById("low-post-center-left-fga").value]);
        shots.push(zone);
    }
    if(!!document.getElementById("low-post-center-right-fgm").value && !!document.getElementById("low-post-center-right-fga").value){
        var zone = [];
        zone.push([serieID,"low-post-center-right-fgm",document.getElementById("low-post-center-right-fgm").value]);
        zone.push([serieID,"low-post-center-right-fga",document.getElementById("low-post-center-right-fga").value]);
        shots.push(zone);
    }
    if(!!document.getElementById("low-post-right-fgm").value && !!document.getElementById("low-post-right-fga").value){
        var zone = [];
        zone.push([serieID,"low-post-right-fgm",document.getElementById("low-post-right-fgm").value]);
        zone.push([serieID,"low-post-right-fga",document.getElementById("low-post-right-fga").value]);
        shots.push(zone);
    }
    if(!!document.getElementById("triple-left-fgm").value && !!document.getElementById("triple-left-fga").value){
        var zone = [];
        zone.push([serieID,"triple-left-fgm",document.getElementById("triple-left-fgm").value]);
        zone.push([serieID,"triple-left-fga",document.getElementById("triple-left-fga").value]);
        shots.push(zone);
    }
    if(!!document.getElementById("triple-right-fgm").value && !!document.getElementById("triple-right-fga").value){
        var zone = [];
        zone.push([serieID,"triple-right-fgm",document.getElementById("triple-right-fgm").value]);
        zone.push([serieID,"triple-right-fga",document.getElementById("triple-right-fga").value]);
        shots.push(zone);
    }
    if(!!document.getElementById("triple-center-fgm").value && !!document.getElementById("triple-center-fga").value){
        var zone = [];
        zone.push([serieID,"triple-center-fgm",document.getElementById("triple-center-fgm").value]);
        zone.push([serieID,"triple-center-fga",document.getElementById("triple-center-fga").value]);
        shots.push(zone);
    }
    return shots;
}*/