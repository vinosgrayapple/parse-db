#! /usr/bin/awk -f
# BEGIN {
#      "date" | getline current_time
#      close("date")
#      print "Report printed on " current_time
#      "pwd" | getline current_dir
#      close("pwd")
#      n=split(current_dir,dir,"/")
#      print "Current dir is: \"" dir[n]"\""
# }

BEGIN {
  # a=
# system("echo " $1)
a = "Вина у пляшках з грибоподібними корками, які підтримуються за допомогою кріплень чи зав'язок; з надмірним тиском не менш як 1 бар, але менш як 3 бар при температурі 20 град. С, який зумовлений розчиненим діоксидом вуглецю з захищеною географічною ознакою (Protected Geographical Indication, PGI) GIACONDI Lambrusco Rosso Emilia IGT Amabile Алк.7,5% - 2070 пл. / 1552,5 л. GIACONDI Lambrusco Bianco Emilia IGT Amabile Алк.7,5% - 2760 пл. / 2070 л. Країна походження - Італія Країна виробництва - IT Торговельна марка - GIACONDI Виробник - MGM MONDO DEL VINO S.R.L."
cmd = "echo \""a"\" | sed -e 's/[^0-9]//g'"
print cmd
while ( ( cmd | getline result ) > 0 ) {
  print  result
} 
close(cmd)

# print "first print"
# "echo "a"| perl -pe 'm/[^ \:\-][0-9A-Za-z\x27\x20\x2D\x2E\x26\x2F]+/i'"| getline res
# print res
# IGNORECASE=1;
# # d=match(a,/(Т?о?р?г?[оі]*вельно?[аію\.]*[ ]*м?а?р?к?о?[аию]?(\/Виробник)?|[ТT][МM]|Торг(ова)?.? *марка)\s*[\x3A\x2D\x3C]*\s*([^ \:\-][0-9A-Za-z\x27\x20\x2D\x2E\x26\x2F]+)/,eng);
# d=match(a,/(Т?о?р?г?[оі]*вельно?[аію][ ]*м?а?р?к?о?[аию]?(\/Виробник)?|[ТT][МM]|Торг(ова)?.? *марка)\s*[\:\-\x3C\x2D]\s*([A-Za-z\x27\x20\x2D\x2E\x26\x2F]*)+/,eng);
# match(a,/Торговельна марка:([a-z ]+)/,engTM)
# match(a,/Виробник:([a-z ]+)/,engPROD)
# match(a,/Країна виробництва:([a-z ]+)/,engCO)

# # print engTM[1]
# # print engPROD[1]
# # print engCO[1]
# print eng[4]
# print eng[0]
# print d
}
