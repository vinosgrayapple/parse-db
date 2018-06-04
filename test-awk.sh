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
IGNORECASE=1;
a = "Вина виноградні, напівігристі з фактичною концентрацією спирту 8,0 об.% білі, напівсухі, в пляшках по 0.75 л., тиск 2,2 атм., вміст цукру 5,0% маси, марки Valmarone Lambrusco Bianco Emilia IGT Метро-арт. 360743-1260 пл.(945 л.), дата розливу 05/03/15 р., урожаю 2014 р. термін придатності 2 р. Виробник - Contri Spumanti SpA. Торгівельна марка - Valmarone. Країна виробництва IT."
d=match(a,/(Т?о?р?г?[оі]*вельно?[аію][ ]*м?а?р?к?о?[аию]?(\/Виробник)?|[ТT][МM]|Торг(ова)?.? *марка)\s*[\:\-\x3C\x2D]\s*([A-Za-z\x27\x20\x2D\x2E\x26\x2F]*)+/,eng);
match(a,/Торговельна марка:([a-z ]+)/,engTM)
match(a,/Виробник:([a-z ]+)/,engPROD)
match(a,/Країна виробництва:([a-z ]+)/,engCO)

print engTM[1]
print engPROD[1]
print engCO[1]
print eng[4]
print d
}
