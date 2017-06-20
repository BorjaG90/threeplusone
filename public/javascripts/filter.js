/**
  * Created by Borja Gete on 20/05/17.
  */

/**
  * Establece los valores de una Inscripción dependiendo de si involucra una
  * Competición, un Grupo o un SubGrupo
  **/
function inscription(){
    var options = document.getElementById("asignation").options;
    var id = options[options.selectedIndex].id;
    var value = options[options.selectedIndex].value;
    if(id.charAt(0)==="C"){
        document.getElementById("id_competition").value = value;
        document.getElementById("id_group").value = "";
        document.getElementById("id_subgroup").value = "";
    }else if(id.charAt(0)==="G"){
        var idG = id.substring(id.lastIndexOf("-")+1);
        document.getElementById("id_competition").value = document.getElementById("CG-" + idG).value;
        document.getElementById("id_group").value = value;
        document.getElementById("id_subgroup").value = "";
    }else if(id.charAt(0)==="S"){
        var idS = id.substring(id.lastIndexOf("-")+1);
        document.getElementById("id_competition").value = document.getElementById("CS-" + idS).value;
        document.getElementById("id_group").value = document.getElementById("GS-" + idS).value;
        document.getElementById("id_subgroup").value = value;
    }
}
/**
  * Recibe una tabla y una columna y ordena los valores de esa columna en
  * dicha tabla
  **/
function sortTable(n, idTable) {
  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
  table = document.getElementById(idTable);
  switching = true;
  //Set the sorting direction to ascending:
  dir = "asc";
  /*Make a loop that will continue until
  no switching has been done:*/
  while (switching) {
    //start by saying: no switching is done:
    switching = false;
    rows = table.getElementsByTagName("TR");
    /*Loop through all table rows (except the
    first, which contains table headers):*/
    for (i = 1; i < (rows.length - 1); i++) {
      //start by saying there should be no switching:
      shouldSwitch = false;
      /*Get the two elements you want to compare,
      one from current row and one from the next:*/
      x = rows[i].getElementsByTagName("TD")[n];
      y = rows[i + 1].getElementsByTagName("TD")[n];
      /*check if the two rows should switch place,
      based on the direction, asc or desc:*/
      if (dir === "asc") {
        if(isNumber(x.innerHTML.toLowerCase()) && isNumber(y.innerHTML.toLowerCase())){
            if (parseFloat(x.innerHTML) > parseFloat(y.innerHTML)) {
                //if so, mark as a switch and break the loop:
                shouldSwitch= true;
                break;
            }
        }else{
            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
              //if so, mark as a switch and break the loop:
              shouldSwitch= true;
              break;
            }
        }
      } else if (dir === "desc") {
        if(isNumber(x.innerHTML.toLowerCase()) && isNumber(y.innerHTML.toLowerCase())){
            if (parseFloat(x.innerHTML) < parseFloat(y.innerHTML)) {
                //if so, mark as a switch and break the loop:
                shouldSwitch= true;
                break;
            }
        }else{
            if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
              //if so, mark as a switch and break the loop:
              shouldSwitch= true;
              break;
            }
        }
      }
    }
    if (shouldSwitch) {
      /*If a switch has been marked, make the switch
      and mark that a switch has been done:*/
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
      //Each time a switch is done, increase this count by 1:
      switchcount ++;
    } else {
      /*If no switching has been done AND the direction is "asc",
      set the direction to "desc" and run the while loop again.*/
      if (switchcount === 0 && dir === "asc") {
        dir = "desc";
        switching = true;
      }
    }
  }
}

/**
  * Devuelve un booleano que indica si el parámetro pasado es numérico
  **/
function isNumber(n) {
  return !isNaN(parseFloat(n)) && isFinite(n);
}

/**
  * Recibe una tabla y una columna y ordena los valores de esa columna en
  * dicha tabla de forma ascendente
  **/
function sortTableAsc(n, idTable) {
  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
  table = document.getElementById(idTable);
  switching = true;
  while (switching) {
    switching = false;
    rows = table.getElementsByTagName("TR");
    for (i = 1; i < (rows.length - 1); i++) {
      shouldSwitch = false;
      x = rows[i].getElementsByTagName("TD")[n];
      y = rows[i + 1].getElementsByTagName("TD")[n];
        if(isNumber(x.innerHTML.toLowerCase()) && isNumber(y.innerHTML.toLowerCase())){
            if (parseFloat(x.innerHTML) > parseFloat(y.innerHTML)) {
                shouldSwitch= true;
                break;
            }
        }else{
            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
              shouldSwitch= true;
              break;
            }
        }
    }
    if (shouldSwitch) {
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
      switchcount ++;
    } else {
      if (switchcount == 0) {
        switching = true;
      }
    }
  }
}

/**
  * Recibe una tabla y una columna y ordena los valores de esa columna en
  * dicha tabla de forma descendente
  **/
function sortTableDesc(n, idTable) {
  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
  table = document.getElementById(idTable);
  switching = true;
  while (switching) {
    switching = false;
    rows = table.getElementsByTagName("TR");
    for (i = 1; i < (rows.length - 1); i++) {
      shouldSwitch = false;
      x = rows[i].getElementsByTagName("TD")[n];
      y = rows[i + 1].getElementsByTagName("TD")[n];
        if(isNumber(x.innerHTML.toLowerCase()) && isNumber(y.innerHTML.toLowerCase())){
            if (parseFloat(x.innerHTML) < parseFloat(y.innerHTML)) {
                shouldSwitch= true;
                break;
            }
        }else{
            if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
              shouldSwitch= true;
              break;
            }
        }
      }
    if (shouldSwitch) {
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
      switchcount ++;
    } else {
      if (switchcount == 0) {
        switching = true;
      }
    }
  }
}

/**
  * Muestra los formularios ocultos dependiendo del botón pulsado
  **/
function openForm(evt, formul) {
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tabcontent = document.getElementsByClassName("tabcontent2");
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

/**
  * Muestra los formularios ocultos dependiendo del botón pulsado
  **/
function openForm2(evt, formul) {
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent2");
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

/**
  * Muestra el div de ayuda
  **/
function openHelp(){
    document.getElementById("help").style.display = "inline";
    document.getElementById("legend").style.display = "none";
}

/**
  * Cierra el div de ayuda
  **/
function closeHelp(){
    document.getElementById("help").style.display = "none";
}

/**
  * Muestra el div de Leyenda
  **/
function openLegend(){
    document.getElementById("legend").style.display = "inline";
    document.getElementById("help").style.display = "none";
}

/**
  * Cierra el div de leyenda
  **/
function closeLegend(){
    document.getElementById("legend").style.display = "none";
}