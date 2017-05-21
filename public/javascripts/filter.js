/**
  * Created by Borja Gete on 20/05/17.
  */
function inscription(){
    var options = document.getElementById("asignation").options;
    var id = options[options.selectedIndex].id;
    var value = options[options.selectedIndex].value;
    if(id.charAt(0)=="C"){
        document.getElementById("id_competition").value = value;
        document.getElementById("id_group").value = "";
        document.getElementById("id_subgroup").value = "";
    }else if(id.charAt(0)=="G"){
        var idG = id.substring(id.lastIndexOf("-"))
        document.getElementById("id_competition").value = document.getElementById("CG-" & idG).value;
        document.getElementById("id_group").value = value;
        document.getElementById("id_subgroup").value = "";
    }else if(id.charAt(0)=="S"){
    var idS = id.substring(id.lastIndexOf("-"))
        document.getElementById("id_competition").value = document.getElementById("CS-" & idS).value;
        document.getElementById("id_group").value = document.getElementById("GS-" & idS).value;
        document.getElementById("id_subgroup").value = value;
    }
}
/*
Recibe una tabla y una columna y ordena los valores de esa columna en dicha tabla
*/
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
      if (dir == "asc") {
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
      } else if (dir == "desc") {
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
      if (switchcount == 0 && dir == "asc") {
        dir = "desc";
        switching = true;
      }
    }
  }
}
function isNumber(n) {
  return !isNaN(parseFloat(n)) && isFinite(n);
}