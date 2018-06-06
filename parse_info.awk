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
  match($0,/((То?ро?г?[оі]?вельн[аі]|Торг(\.|ова))\s*марк?[аи](\/Виробник)?|\b[ТT][МM]|Торговельною маркою)[\x3A\-\x3C ]*([A-Za-z][0-9A-Za-z\x27\x20\x2D\x2E\x26\x2F\x60]+)/,eng);
  match($0,/((То?ро?г?[оі]?вельн[аі]|Торг(\.|ова))\s*марк?[аи](\/Виробник)?|\b[ТT][МM]|Торговельною маркою)[\x3A\-\x3C ]*([^ \:\-][А-ЯЇІЄҐа-яіїґ]+( [А-ЯЇІЄҐа-яіїґ]+)?)/,ukr);
 
indx = 5;
if (eng[indx] !~ /^[\s\-\: ]*$/) {
  str=eng[indx];
} else if (ukr[indx] !~ /^[\s\-\: ]*$/) {
str=ukr[indx];
} else {
  str="неизвестНа";
}
gsub(/[\. ]+\n/,"\n",str);
gsub(/^Виробник$/,"неизвестНа",str);
gsub(/(Виробник|Акцизні|Країна|на$)/,"",str);


print NR";"trim(str);

  }

END {

}
