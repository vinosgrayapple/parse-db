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

END {

}