/**
  * Created by Borja Gete on 24/04/17.
  */

/**
  * Calcula el porcentaje de lanzamiento de tiros conseguidos sobre tiros intentados
  **/
function calculatePercentage(idMade,idAtt,min,max,idSvg){
    var made = document.getElementById(idMade).value;
    var att = document.getElementById(idAtt).value;
    if(att != null && att != "" && parseInt(made) > parseInt(att)){
        document.getElementById(idAtt).value = "Err";
    }
    validateNumber(idMade,"btn-submit2");
    validateNumber(idAtt,"btn-submit2");

    var r = (made / att) * 100;
     if(r <= min && r < 101){
        document.getElementById(idSvg).className.baseVal = "zone bad-fg";
    }else if(r>= max && r < 101){
        document.getElementById(idSvg).className.baseVal = "zone good-fg";
    }else{
        document.getElementById(idSvg).className.baseVal = "zone neutral-fg";
    }
    var madeDown = idMade + "-down";
    var attDown = idAtt + "-down";
    document.getElementById(madeDown).value=made;
    document.getElementById(attDown).value=att;
}

/**
  * Coloca los valores de los inputs del formulario regular en el formulario
  * ShotChart
  **/
function setInShotChart(id){
    validateNumber(id+ "-down","btn-submit2");
    var value = document.getElementById(id+ "-down").value;
    document.getElementById(id).value=value;
    document.getElementById(id).onchange();
}

/**
  * Muestra el formulario ShotChart
  **/
function openFormSC(evt, formul, serieId) {
    document.getElementById("id_serie_shot").value = serieId;

    // Get all elements with class="tabcontent" and hide them
    var tabcontent = document.getElementsByClassName("tabcontent");
    for (var i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    var tablinks = document.getElementsByClassName("tablinks");
    for (var i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(formul).style.display = "block";
    evt.currentTarget.className += " active";
}