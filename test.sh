# awk -F"\";\"" '$17!~/(Виноматеріал|Бірмікс|UA)/{IGNORECASE=1;gsub(/\"/,"",$17);match($0,/(Торг[оі]вельна марка[:-]?|Торгова марка|Торговельні марки:|Торг. ?марка:?|Торговельна ?марка ?|ТМ)([A-Za-z \\&\.\-\x27]+|[а-щА-ЩЬьЮюЯяЇїІі ЄєҐґ]*)/,a);if(a[1]){print NR"." a[2]}else{print NR"--"$17}}' 2015_2.csv | sed 3705q


BEGIN {
     "date" | getline current_time
     close("date")
     print "Report printed on " current_time
}