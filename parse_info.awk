function red(s) {return "\033[1;31m" s "\033[0m "}
function green(s) {return "\033[1;32m" s "\033[0m "}
function blue(s) {return "\033[1;34m" s "\033[0m "}
function cyan(s) {return "\033[1;36m" s "\033[0m "}
function yellow(s) {return "\033[1;33m" s "\033[0m "}
function line() {print "\033[1;35m-----------------------------------------\033[0m "}
BEGIN{

}

# NR==100,NR==8000
{
  IGNORECASE=1;
  # print blue(NR"=>  "ukr[0])
  # tradeEngl="/(Торг[оі]вельна марка(\/Виробник)?|ТМ)[ \:]*?(\<[A-Z][A-Za-z\x27\x20\x2D\x2E\x26]*?\>)+/";
  # tradeUkr="(Торг[оі]вельна марка(\/Виробник)?|ТМ)[ \:]*?(\<[A-ZА-ЯЇІЄҐ][А-Яа-яії\x27\x20\x2D\x2E\x26]*?\>)+";
  match($0,/(Т?о?р?г?[оі]*вельн[аію][ ]*м?а?р?к?[аию]?(\/Виробник)?|[ТT][МM]|Торг(ова)?.? *марка)(\s*[\:\-\x3C]\s*)?\s*([A-Za-z\x27\x20\x2D\x2E\x26]*)+/,eng);
  match($0,/(Т?о?р?г?[оі]вельн[аію][ ]*м?а?р?к?[аию]?(\/Виробник)?|[ТT][МM]|Торг(ова)?.? *марка)(\s*[\:\-\x3C]\s*)?\s*([А-ЯЇІЄҐ][А-Яа-яії]+( [А-ЯЇІЄҐ][А-Яа-яії]*)?)+/,ukr);
  # if (ukr[4] != "") {
  #    print green(NR"=>  "),cyan(ukr[4])#,yellow($0)
  #   line();
  #   # print eng[0];
  #   } else if (eng[4] != "") {
  #     print red(NR". "),cyan(eng[4])#,yellow("  "$0);
  #     line();
  #   } else {
  #     print red(NR". "),cyan("-=ПУСТО=-")yellow("  "$0);
  #     line();
  #   }


print NR"."ukr[5]"\n"
print "=================================================";
print NR"."eng[5]"\n"
print "================================================="
#  if (ukr[4] != "") {
#      print NR"=>  "ukr[4]#,yellow($0)
#     # line();
#     # print eng[0];
#     } else if (eng[4] != "") {
#       print NR". "eng[4]#,yellow("  "$0);
#       # line();
#     } else {
#       print NR". ";
#       # line();
#     }


  }
#

  


  # if (ukr[4] == "" && eng[4] == "") {
  #   print red(NR". "),cyan("-=ПУСТО=-")yellow("  "$0);
  #     line();
  # }
# }
END {

}