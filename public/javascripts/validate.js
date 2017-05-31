/**
  * Created by Borja Gete on 30/05/17.
  */
function isValidDate(text) {
  let sep              = "[/|-]",
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

  anno1a9999     = "(0{2,3}[1-9]|0{1,2}[1-9]\\d|0?[1-9]\\d{2}|[1-9]\\d{3})",
  annoMult4no100   = "\\d{1,2}(?:0[48]|[2468][048]|[13579][26])",
  annoMult400      = "(?:0?[48]|[13579][26]|[2468][048])00",
  annoBisiesto     = "("+annoMult4no100+"|"+annoMult400+")",

  fechaNo29Feb     = anno1a9999+sep+diamesNo29Feb,
  fecha29Feb       = annoBisiesto+sep+diames29Feb,

  fechaFinal       = "^(?:"+fechaNo29Feb+"|"+fecha29Feb+")$";

  valida = new RegExp(fechaFinal);
  return valida.exec(text)
}
function validateDate(element, submit){
    text=document.getElementById(element).value;
    button=document.getElementById(submit);
    if(text != null){
        if(!isValidDate(text)){
            alert('[ERROR] El campo debe tener un valor de fecha valido');
            button.style.display = "none"
            return false;
        }
    }
    button.style.display = "inline"
    slash = "/"
    document.getElementById(element).value = replaceAll(text,"/","-")
    return true
}
function replaceAll(str, find, replace) {
  return str.replace(new RegExp(escapeRegExp(find), 'g'), replace);
}
function escapeRegExp(str) {
    return str.replace(/([.*+?^=!:${}()|\[\]\/\\])/g, "\\$1");
}