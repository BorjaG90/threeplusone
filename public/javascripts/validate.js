/**
  * Created by Borja Gete on 30/05/17.
  */

/**
  * Devuelve una cadena válida sin caracteres especiales
  **/
function escapeRegExp(str) {
    return str.replace(/([.*+?^=!:${}()|\[\]\/\\])/g, "\\$1");
}

/**
  * Realiza un Replace en una subcadena que cumpla un patrón
  **/
function replaceAll(str, find, replace) {
  return str.replace(new RegExp(escapeRegExp(find), 'g'), replace);
}

/**
  * Devuelve un booleano que indica si el parámetro pasado es una fecha valida
  **/
function isValidDate(text) {
  let sep          = "[/|-]",
  dia1a28          = "(0?[1-9]|1\\d|2[0-8])",
  dia29            = "(29)",
  dia29o30         = "(29|30)",
  dia31            = "(31)",

  mes1a12          = "(0?[1-9]|1[0-2])",
  mes2             = "(0?2)",
  mesNoFeb         = "(0?[13-9]|1[0-2])",
  mes31dias        = "(0?[13578]|1[02])",

  diames29Feb      = mes2+sep+dia29,
  diames1a28       = mes1a12+sep+dia1a28,
  diames29o30noFeb = mesNoFeb+sep+dia29o30,
  diames31         = mes31dias+sep+dia31,
  diamesNo29Feb    = "(?:"+diames1a28+"|"+diames29o30noFeb+"|"+diames31+")",

  anno1a9999       = "(0{2,3}[1-9]|0{1,2}[1-9]\\d|0?[1-9]\\d{2}|[1-9]\\d{3})",
  annoMult4no100   = "\\d{1,2}(?:0[48]|[2468][048]|[13579][26])",
  annoMult400      = "(?:0?[48]|[13579][26]|[2468][048])00",
  annoBisiesto     = "("+annoMult4no100+"|"+annoMult400+")",

  fechaNo29Feb     = anno1a9999+sep+diamesNo29Feb,
  fecha29Feb       = annoBisiesto+sep+diames29Feb,

  fechaFinal       = "^(?:"+fechaNo29Feb+"|"+fecha29Feb+")$";

  var valida = new RegExp(fechaFinal);
  return valida.exec(text);
}

/**
  * Valida el valor de un input como una fecha valida y desactiva o activa el
  * botón de submit en consecuencia
  **/
function validateDate(element, submit){
    var text=document.getElementById(element).value;
    var button=document.getElementById(submit);
    if(text != null && text != ""){
        if(!isValidDate(text)){
            alert("[ERROR] El campo debe tener un valor de fecha valido");
            button.style.display = "none";
            button.classList.add("date");
            return false;
        }
    }
    button.classList.remove("date")
    if(!button.classList.contains("number")){
        button.style.display = "inline";
    }
    document.getElementById(element).value = replaceAll(text,"/","-");
    return true;
}

/**
  * Valida el valor de un input como un númerico valido y desactiva o activa el
  * botón de submit en consecuencia
  **/
function validateNumber(element, submit){
    var text=document.getElementById(element).value;
    var button=document.getElementById(submit);
    if(text != null && text != ""){
        if(!isNumber(text)){
            alert('[ERROR] El campo debe tener un valor númerico valido');
            button.style.display = "none";
            button.classList.add("number");
            return false;
        }
    }
    button.classList.remove("number")
    if(!button.classList.contains("date")){
        button.style.display = "inline";
    }
    document.getElementById(element).value = replaceAll(text,"/","-");
    return true;
}