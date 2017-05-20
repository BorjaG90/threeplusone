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