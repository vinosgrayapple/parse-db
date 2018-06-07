function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
function rtrim(s) { sub(/[ \t\r\n\.\,\(]+$/, "", s); return s }
function trim(s) { return rtrim(ltrim(s)); }

function red(s) {return "\033[1;31m" s "\033[0m "}
function green(s) {return "\033[1;32m" s "\033[0m "}
function blue(s) {return "\033[1;34m" s "\033[0m "}
function cyan(s) {return "\033[1;36m" s "\033[0m "}
function yellow(s) {return "\033[1;33m" s "\033[0m "}
function line() {print "\033[1;35m-----------------------------------------\033[0m "}

BEGIN{
  PDO["2204101100"] = "Сhampagne (шампанське)";
  PDO["2204109100"] = "Asti spumante (астi спуманте)";
  PDO["2204211100"] = "ельзаське (Alsace)";
  PDO["2204211200"] = "бордо (Bordeaux)";
  PDO["2204211300"] = "бургундське (Bourgogne)";
  PDO["2204211700"] = "долина Луари (Val de Loire)";
  PDO["2204211800"] = "мозель-саар-рувер (Mosel-Saar-Ruwer)";
  PDO["2204211900"] = "пфальц (Pfalz)";
  PDO["2204212200"] = "рейнхесен (Rheinhessen)";
  PDO["2204212300"] = "токайське (Tokay)";
  PDO["2204212400"] = "лацiо (Lazio)";
  PDO["2204212600"] = "тосканське (Toscana)";
  PDO["2204212700"] = "трентiно (Trentino), альто адiдже (Alto Adige) i фрiулi (Friuli)";
  PDO["2204212800"] = "венето (Veneto)";
  PDO["2204213200"] = "вино верде (Vinho Verde)";
  PDO["2204213400"] = "пенедеc (Penedes)";
  PDO["2204213600"] = "рiоя (Rioja)";
  PDO["2204213700"] = "валенсiя (Valencia)";
  PDO["2204214200"] = "бордо (Bordeaux)";
  PDO["2204214300"] = "бургундське (Bourgogne)";
  PDO["2204214400"] = "божоле (Beaujolais)";
  PDO["2204214600"] = "кот дю рон (Cotes du Rhone)";
  PDO["2204214700"] = "лангедок-русiльйон (Languedoc-Roussillon)";
  PDO["2204214800"] = "долина Луари (Val de Loire)";
  PDO["2204216200"] = "п'ємонт (Piemonte)";
  PDO["2204216600"] = "тосканське (Toscana)";
  PDO["2204216700"] = "трентiно (Trentino) i альто адiдже (Alto Adige)";
  PDO["2204216800"] = "венето (Veneto)";
  PDO["2204216900"] = "дао (Dao), берада (Bairrada) i дуро (Douro)";
  PDO["2204217100"] = "навара (Navarra)";
  PDO["2204217400"] = "пенедес (Penedes)";
  PDO["2204217600"] = "рiоя (Rioja)";
  PDO["2204217700"] = "вальдепенiас (Valdepenas)";
  PDO["2204218500"] = "мадера (Madeira) i мускатель сетюбаль (Moscatel de Setubal)";
  PDO["2204218600"] = "херес (Sherry)";
  PDO["2204218700"] = "марсала (Marsala)";
  PDO["2204218800"] = "самос (Samos) i мускат лемнос (Muscat de Lemnos)";
  PDO["2204218900"] = "портвейн (Port)";
  PDO["2204291100"] = "токайське (Tokay)";
  PDO["2204291200"] = "бордо (Bordeaux)";
  PDO["2204291300"] = "бургундське (Bourgogne)";
  PDO["2204291700"] = "долина Луари (Val de Loire)";
  PDO["2204294200"] = "бордо (Bordeaux)";
  PDO["2204294300"] = "бургундське (Bourgogne";
  PDO["2204294400"] = "божоле (Beaujolais)";
  PDO["2204294600"] = "кот дю рон (Cotes du Rhone)";
  PDO["2204298900"] = "портвейн (Port)";
  PDO["2204294700"] = "лангедок-русiльйон (Languedoc-Roussillon)";
  PDO["2204294800"] = "долина Луари (Val de Loire)";
  PDO["2204298500"] = "мадера (Madeira) i мускатель сетюбаль (Moscatel de Setubal)";
  PDO["2204298600"] = "херес (Sherry)";
  PDO["2204298700"] = "марсала (Marsala)";
  PDO["2204298800"] = "самос (Samos) i мускат лемнос (Muscat de Lemnos)";
}
  
{
  IGNORECASE=1;
  # gsub($0,/Країна виробництва/,"")
  match($0,/(PDO\ |регіоні|вироблені у регіоні|вироблене в регіоні|регіонах|зонах|регіону|зоні|зона|регіон|PDO\(|PDO\)\,|вироблене\ *в|PDO\)\,\ без\ додавання\ спирту\:.*\/)[\x3A\-\x3C ]*([A-Za-z][0-9A-Za-z\x27\x20\x2D\x2E\x26\x2F\x60]+)/,eng);
  match($0,/(PDO\ |регіоні|вироблені у регіоні|вироблене в регіоні|регіонах|зонах|регіону|зоні|зона|регіон|PDO\(|PDO\)\,|вироблене\ *в)[\x3A\-\x3C ]*([А-ЯЇІЄҐа-яіїґ\.\-\x27]+( [А-ЯЇІЄҐа-яіїґ\x27]+)?)/,ukr);
  
  indx = 2;
  if (eng[indx] !~ /^[\s\-\: ]*$/) {
    str=eng[indx];
  } else if (ukr[indx] !~ /^[\s\-\: ]*$/) {
    str=ukr[indx];
  } else {
    str="отстутствует";
  }

  # gsub(/[\. ]+\n/,"\n",str);
  # gsub(/^Виробник$/,"неизвестНа",str);
  # gsub(/(Виробник|Акцизні|Країна|на$)/,"",str);
  
  print NR";"trim(str)";"$0;

}

END {}