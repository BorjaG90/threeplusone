/**
  * Created by Borja Gete on 24/04/17.
  */
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
function openFormSC(evt, formul, serieId) {
    // Declare all variables
    var i, tabcontent, tablinks;
    document.getElementById('id_serie_shot').value = serieId;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(formul).style.display = "block";
    evt.currentTarget.className += " active";
}