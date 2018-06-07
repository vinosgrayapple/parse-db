function printLine(TYPE) {
  print "\""
  IMEXP FS INFO FS TYPE FS UKTZED FS COUNTRY_TRADE FS COUNTRY_OF_ORIGIN FS YEAR FS MONTH FS EXPORTER FS IMPORTER FS NETTO_KG FS BRUTTO_KG FS QUANTITY FS TM FS UNIT FS FACTOR_PRICE FS PRODUCER FS PDO_COUNTRY FS CUSTOMS_VALUE "\"";
}

function ltrim(s) {  sub(/^[ \t\r\n]+/, "", s);  return s}

function rtrim(s) {  sub(/[ \t\r\n]+$/, "", s);  return s}

function trim(s) {  return rtrim(ltrim(s));}

function red(s) {  printf "\033[1;31m"  s "\033[0m "}

function green(s) {  return "\033[1;32m"  s "\033[0m "}

function blue(s) {  return "\033[1;34m"  s "\033[0m "}

BEGIN {
  IGNORECASE = 1;
  FS = delim;
  country["EU"] = "ЄВРОПЕЙСЬКИЙ СОЮЗ (ЄС)";
  country["AF"] = "Афганістан";
  country["AL"] = "Албанія";
  country["AQ"] = "Антарктика";
  country["DZ"] = "Алжир";
  country["AS"] = "Американське Самоа";
  country["AD"] = "Андорра";
  country["AO"] = "Ангола";
  country["AG"] = "Антигуа І Барбуда";
  country["AZ"] = "Азербайджан";
  country["AR"] = "Аргентина";
  country["AU"] = "Австралія";
  country["AT"] = "Австрія";
  country["BS"] = "Багамські Острови";
  country["BH"] = "Бахрейн";
  country["BD"] = "Бангладеш";
  country["AM"] = "Вірменія";
  country["BB"] = "Барбадос";
  country["BE"] = "Бельгія";
  country["BM"] = "Бермудські Острови";
  country["BT"] = "Бутан";
  country["BO"] = "Болівія";
  country["BA"] = "Боснія І Герцеговина";
  country["BW"] = "Ботсвана";
  country["BV"] = "Острів Буве";
  country["BR"] = "Бразилія";
  country["BZ"] = "Беліз";
  country["IO"] = "Британська Територія В Індійському Океані";
  country["SB"] = "Соломонові Острови";
  country["VG"] = "Віргінські Острови (Брит.)";
  country["BN"] = "Бруней-Даруссалам";
  country["BG"] = "Болгарія";
  country["MM"] = "М'Янма";
  country["BI"] = "Бурунді";
  country["BY"] = "Білорусь";
  country["KH"] = "Камбоджа";
  country["CM"] = "Камерун";
  country["CA"] = "Канада";
  country["CV"] = "Кабо-Верде";
  country["KY"] = "Кайманові Острови";
  country["CF"] = "Центральноафриканська Республіка";
  country["LK"] = "Шри-Ланка";
  country["TD"] = "Чад";
  country["CL"] = "Чілі";
  country["CN"] = "Китай";
  country["TW"] = "Тайвань, Провінція Китаю";
  country["CX"] = "Острів Різдва";
  country["CC"] = "Кокосові (Кілінг) Острови";
  country["CO"] = "Колумбія";
  country["KM"] = "Комори";
  country["YT"] = "Майотта";
  country["CG"] = "Конго";
  country["CD"] = "Конго, Демократична Республіка";
  country["CK"] = "Острови Кука";
  country["CR"] = "Коста-Рика";
  country["HR"] = "Хорватія";
  country["CU"] = "Куба";
  country["CY"] = "Кіпр";
  country["CZ"] = "Чехія";
  country["BJ"] = "Бенін";
  country["DK"] = "Данія";
  country["DM"] = "Домініка";
  country["DO"] = "Домініканська Республіка";
  country["EC"] = "Еквадор";
  country["SV"] = "Сальвадор";
  country["GQ"] = "Екваторіальна Гвінея";
  country["ET"] = "Ефіопія";
  country["ER"] = "Еритрея";
  country["EE"] = "Естонія";
  country["FO"] = "Фарерські Острови";
  country["FK"] = "Фолклендські (Мальвінські) Острови";
  country["GS"] = "Південна Джорджія Та Південні Сандвічеві Острови";
  country["FJ"] = "Фіджі";
  country["FI"] = "Фінляндія";
  country["AX"] = "Аландські Острови";
  country["FR"] = "Франція";
  country["GF"] = "Французька Гвіана";
  country["PF"] = "Французька Полінезія";
  country["TF"] = "Французькі Південні Території";
  country["DJ"] = "Джибуті";
  country["GA"] = "Габон";
  country["GE"] = "Грузія";
  country["GM"] = "Гамбія";
  country["PS"] = "Палестина";
  country["DE"] = "Німеччина";
  country["GH"] = "Гана";
  country["GI"] = "Гібралтар";
  country["KI"] = "Кірибаті";
  country["GR"] = "Греція";
  country["GL"] = "Гренландія";
  country["GD"] = "Гренада";
  country["GP"] = "Гваделупа";
  country["GU"] = "Гуам";
  country["GT"] = "Гватемала";
  country["GN"] = "Гвінея";
  country["GY"] = "Гаяна";
  country["HT"] = "Гаїті";
  country["HM"] = "Острів Герд І Острови Макдоналд";
  country["VA"] = "Святий Престол (Держава-Місто Ватикан)";
  country["HN"] = "Гондурас";
  country["HK"] = "Гонконг";
  country["HU"] = "Угорщина";
  country["IS"] = "Ісландія";
  country["IN"] = "Індія";
  country["ID"] = "Індонезія";
  country["IR"] = "Іран, Ісламська Республіка";
  country["IQ"] = "Ірак";
  country["IE"] = "Ірландія";
  country["IL"] = "Ізраїль";
  country["IT"] = "Італія";
  country["CI"] = "Кот-Д'Івуар";
  country["JM"] = "Ямайка";
  country["JP"] = "Японія";
  country["KZ"] = "Казахстан";
  country["JO"] = "Йорданія";
  country["KE"] = "Кенія";
  country["KP"] = "Корейська Народно-Демократична Республіка";
  country["KR"] = "Корея, Республіка";
  country["KW"] = "Кувейт";
  country["KG"] = "Киргизстан";
  country["LA"] = "Лаоська Народно-Демократична Республіка";
  country["LB"] = "Ліван";
  country["LS"] = "Лесото";
  country["LV"] = "Латвія";
  country["LR"] = "Ліберія";
  country["LY"] = "Лівія";
  country["LI"] = "Ліхтенштейн";
  country["LT"] = "Литва";
  country["LU"] = "Люксембург";
  country["MO"] = "Макао";
  country["MG"] = "Мадагаскар";
  country["MW"] = "Малаві";
  country["MY"] = "Малайзія";
  country["MV"] = "Мальдіви";
  country["ML"] = "Малі";
  country["MT"] = "Мальта";
  country["MQ"] = "Мартиніка";
  country["MR"] = "Мавританія";
  country["MU"] = "Маврикій";
  country["MX"] = "Мексика";
  country["MC"] = "Монако";
  country["MN"] = "Монголія";
  country["MD"] = "Молдова";
  country["ME"] = "Чорногорія";
  country["MS"] = "Монтсеррат";
  country["MA"] = "Марокко";
  country["MZ"] = "Мозамбік";
  country["OM"] = "Оман";
  country["NA"] = "Намібія";
  country["NR"] = "Науру";
  country["NP"] = "Непал";
  country["NL"] = "Нідерланди";
  country["CW"] = "Кюрасао";
  country["AW"] = "Аруба";
  country["SX"] = "Сінт-Мартен (Нідерландська Частина)";
  country["BQ"] = "Бонайре, Сінт-Естатіус І Саба";
  country["NC"] = "Нова Каледонія";
  country["VU"] = "Вануату";
  country["NZ"] = "Нова Зеландія";
  country["NI"] = "Нікарагуа";
  country["NE"] = "Нігер";
  country["NG"] = "Нігерія";
  country["NU"] = "Ніуе";
  country["NF"] = "Острів Норфолк";
  country["NO"] = "Норвегія";
  country["MP"] = "Північні Маріанські Острови";
  country["UM"] = "Малі Віддалені Острови Сша";
  country["FM"] = "Мікронезія, Федеративні Штати";
  country["MH"] = "Маршаллові Острови";
  country["PW"] = "Палау";
  country["PK"] = "Пакистан";
  country["PA"] = "Панама";
  country["PG"] = "Папуа-Нова Гвінея";
  country["PY"] = "Парагвай";
  country["PE"] = "Перу";
  country["PH"] = "Філіппіни";
  country["PN"] = "Піткерн";
  country["PL"] = "Польща";
  country["PT"] = "Португалія";
  country["GW"] = "Гвінея-Бісау";
  country["TL"] = "Тимор-Лешті";
  country["PR"] = "Пуерто-Рико";
  country["QA"] = "Катар";
  country["RE"] = "Реюньйон";
  country["RO"] = "Румунія";
  country["RU"] = "Російська Федерація";
  country["RW"] = "Руанда";
  country["BL"] = "Сен-Бартелемі";
  country["SH"] = "Острів Святої Єлени";
  country["KN"] = "Сент-Кітс І Невіс";
  country["AI"] = "Ангілья";
  country["LC"] = "Сент-Люсія";
  country["MF"] = "Сен-Мартен (Французська Частина)";
  country["PM"] = "Сен-П'Єр І Мікелон";
  country["VC"] = "Сент-Вінсент І Гренадіни";
  country["SM"] = "Сан-Марино";
  country["ST"] = "Сан-Томе І Принсіпі";
  country["SA"] = "Саудівська Аравія";
  country["SN"] = "Сенегал";
  country["RS"] = "Сербія";
  country["SC"] = "Сейшельські Острови";
  country["SL"] = "Сьєрра-Леоне";
  country["SG"] = "Сингапур";
  country["SK"] = "Словаччина";
  country["VN"] = "В'Єтнам";
  country["SI"] = "Словенія";
  country["SO"] = "Сомалі";
  country["ZA"] = "Південна Африка";
  country["ZW"] = "Зімбабве";
  country["ES"] = "Іспанія";
  country["SS"] = "Південний Судан";
  country["SD"] = "Судан";
  country["EH"] = "Західна Сахара";
  country["SR"] = "Суринам";
  country["SJ"] = "Шпіцберген Та Ян-Маєн";
  country["SZ"] = "Свазіленд";
  country["SE"] = "Швеція";
  country["CH"] = "Швейцарія";
  country["SY"] = "Сирійська Арабська Республіка";
  country["TJ"] = "Таджикистан";
  country["TH"] = "Таїланд";
  country["TG"] = "Того";
  country["TK"] = "Токелау";
  country["TO"] = "Тонга";
  country["TT"] = "Тринідад І Тобаго";
  country["AE"] = "ОАЕ";
  country["TN"] = "Туніс";
  country["TR"] = "Туреччина";
  country["TM"] = "Туркменистан";
  country["TC"] = "Острови Теркс І Кайкос";
  country["TV"] = "Тувалу";
  country["UG"] = "Уганда";
  country["UA"] = "Україна";
  country["MK"] = "Македонія";
  country["EG"] = "Єгипет";
  country["GB"] = "Велика Британія";
  country["GG"] = "Гернсі";
  country["JE"] = "Джерсі";
  country["IM"] = "Острів Мен";
  country["TZ"] = "Танзанія, Об'Єднана Республіка";
  country["US"] = "Сполучені Штати Америки";
  country["VI"] = "Віргінські Острови (США)";
  country["BF"] = "Буркіна-Фасо";
  country["UY"] = "Уругвай";
  country["UZ"] = "Узбекистан";
  country["VE"] = "Венесуела";
  country["WF"] = "Уолліс І Футуна";
  country["WS"] = "Самоа";
  country["YE"] = "Ємен";
  country["ZM"] = "Замбія";
  country["ZK"] = "Вільна Економічна Зона Крим";
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

####################################################################################################################

{

  if (type == "КОД_МИТНОГО_РЕЖИМУ") {#
    2015 ГОД
    IMEXP = $1;
    INFO = $17;
    UKTZED = $16;
    COUNTRY_TRADE = $28;
    COUNTRY_OF_ORIGIN = $29;
    QUANTITY = $20;
    FULL_DATE = $5;
    EXPORTER = $7;
    IMPORTER = $10;#
    new 01 / 06 / 2018
    NETTO_KG = $18;
    BRUTTO_KG = $19;
    UNIT = $21;
    FACTOR_PRICE = $22;
    CUSTOMS_VALUE = $23;

  } else if (type == "ТИП_ВМД_НАПРАВЛЕНИЯ") {#
    2016 ГОД
    IMEXP = $2;
    INFO = $19;
    UKTZED = $18;
    COUNTRY_TRADE = $35;
    COUNTRY_OF_ORIGIN = $36;
    QUANTITY = $22;
    FULL_DATE = $6;
    EXPORTER = $8;#
    new 01 / 06 / 2018
    IMPORTER = $11;
    NETTO_KG = $20;
    BRUTTO_KG = $21;
    UNIT = $23;
    FACTOR_PRICE = $24;
    CUSTOMS_VALUE = $25;
  } else if (type == "ТИП_МД") {#
    2017 ГОД
    split($2, imp, "/");
    IMEXP = imp[1];
    INFO = $17;
    UKTZED = $16;
    COUNTRY_TRADE = $20;
    COUNTRY_OF_ORIGIN = $20;
    QUANTITY = $25;
    FULL_DATE = $15;
    EXPORTER = $4;#
    new 01 / 06 / 2018
    IMPORTER = $7;
    NETTO_KG = $24;
    BRUTTO_KG = $23;
    UNIT = $26;
    FACTOR_PRICE = $41;
    CUSTOMS_VALUE = $29;
  }
}#################################################################################################################### {
  split(FULL_DATE, a, ".");
  YEAR = a[3];
  MONTH = a[2];##############
  PRODUCER##########################################################################################

  match(INFO, /(Вири?р?об\ ?н?и\ ?(к|цтво)|Вир\-к|Розлито в)[\x3A\-\x3C ]*([A-Za-z][0-9A-Za-z\x27\x20\x2D\x2E\x26\x2F\x60]+)/, eng);
  match(INFO, /(Вири?р?об\ ?н?и\ ?(к|цтво)|Вир\-к|Розлито в)[\x3A\-\x3C ]*([А-ЯЇІЄҐа-яіїґ\.]+( [А-ЯЇІЄҐа-яіїґ]+)?)/, ukr);
  indx = 3;
  if (eng[indx] !~/^[\s\-\: ]*$/) {
    str = eng[indx];
  } else if (ukr[indx] !~/^[\s\-\: ]*$/) {
    str = ukr[indx];
  } else {
    str = "нет данных";
  }
  PRODUCER = trim(str);

  ##############
  TM##########################################################################################

  match($0, /((То?ро?г?[оі]?вельн[аі]|Торг(\.|ова))\s*марк?[аи](\/Виробник)?|\b[ТT][МM]|Торговельною маркою)[\x3A\-\x3C ]*([A-Za-z][0-9A-Za-z\x27\x20\x2D\x2E\x26\x2F\x60]+)/, eng);
  match($0, /((То?ро?г?[оі]?вельн[аі]|Торг(\.|ова))\s*марк?[аи](\/Виробник)?|\b[ТT][МM]|Торговельною маркою)[\x3A\-\x3C ]*([^ \:\-][А-ЯЇІЄҐа-яіїґ]+( [А-ЯЇІЄҐа-яіїґ]+)?)/, ukr);

  indx = 5;
  if (eng[indx] !~/^[\s\-\: ]*$/) {
    str = eng[indx];
  } else if (ukr[indx] !~/^[\s\-\: ]*$/) {
    str = ukr[indx];
  } else {
    str = "неизвестНа";
  }
  gsub(/[\. ]+\n/, "\n", str);
  gsub(/^Виробник$/, "неизвестНа", str);
  gsub(/(Виробник|Акцизні|Країна|на$)/, "", str);


  TM = trim(str);#############
  COUNTRY_OF_ORIGIN#################################################################################
  if (PDO[UKTZED] != null) {#
    PDO_COUNTRY = PDO[UKTZED];#
  } else {#
    PDO_COUNTRY = "";#
  }

  if (COUNTRY_OF_ORIGIN == "") {
    if (match(INFO, /кра[їіъ]на\s+(походження|вир?.?об?ни(к|цтв)а?)(\s*)?([-:()])?(\s*)?(([A-Z][A-Z])|[а-щА-ЩЬьЮюЯяЇїІіЄєҐґ]+?|[0-9][0-9])/, m)) {
      if (m[6] == "не") {
        COUNTRY_OF_ORIGIN = COUNTRY_TRADE;
      } else if (m[6] == "00") {
        COUNTRY_OF_ORIGIN = COUNTRY_TRADE;
      } else if (m[6] ~/[A-Z][A-Z]/) {
        COUNTRY_OF_ORIGIN = country[m[6]];
      } else {
        COUNTRY_OF_ORIGIN = m[6];
      }
    } else {
      COUNTRY_OF_ORIGIN = COUNTRY_TRADE;
    }
  }


  if (trim(COUNTRY_OF_ORIGIN) ~/[A-Z][A-Z]/) {
    COUNTRY_OF_ORIGIN = country[toupper(COUNTRY_OF_ORIGIN)];
  }
  if (COUNTRY_OF_ORIGIN == "0") {
    COUNTRY_OF_ORIGIN = "Дип.Вантаж";
  }
  gsub(/\x22/, "", $0);
  gsub(/\x22/, "", IMEXP);

  gsub(/i/, "і", COUNTRY_OF_ORIGIN);
  gsub(/i/, "і", COUNTRY_TRADE);

  gsub(/ /, "", QUANTITY);
  gsub(/\./, ",", QUANTITY);


  gsub(/\x22/, "", INFO);
  gsub(/("| )/, "", IMEXP);
  sub(/^[0-9\"\-\. ]+/, "", INFO);
  gsub(";", "", INFO);
}

{
  if (IMEXP~/ІМ/) {
    if (INFO!~/(Дипломатичний вантаж|пиво|зразки|подарунок|Бірмікс|Alcoholic Ginger Beer|Джинджер Бір|рисове|саке|sake|НВП Нива ТОВ|Агрофірма Золота Балка)/) {
      if (UKTZED~/(2204298100|2204298200|2204299500|2204299600|2204299700|2204299800)/)
        printLine("ВИНОМАТЕРІАЛ");
      else if (UKTZED~/(220410|2204101100|2204109100|2204109300|2204109400|2204109600|2204109800|2204210600|2204210700|2204210800|2204210900|2206003900|2206008900)/)
        printLine("ІГРИСТЕ");
      else if (UKTZED~/(220421|2204211100|2204211200|2204211300|2204211700|2204211800|2204211900|2204212200|2204212300|2204212400|2204212600|2204212700|2204212800|2204213200|2204213400|2204213600|2204213700|2204213800|2204214200|2204214300|2204214400|2204214600|2204214700|2204214800|2204216200|2204216600|2204216700|2204216800|2204216900|2204217100|2204217400|2204217600|2204217700|2204217800|2204217900|2204218000|2204218100|2204218200|2204218300|2204218400|2204218500|2204218600|2204218700|2204219000|2204219300|2204219400|2204219500|2204219600|2204219700|2204219800|2204291800|2204294200|2204294700|2204295800|2204297900|2204298000|2204298300|2204298400|2204299000|2204299400|2204301000|2204309400)/) {
        if (INFO~/(херес|кріплене|міцне)/)
          printLine("ТИХЕ_МІЦНЕ");
        else if (INFO~/([sc]hampagne|spumante|\bcava\b|lambrusco|franciacorta|cremant|fragolino|prosecco|frizzante|sparkling|вин[оа] ігрист[еі][.,]|ігрист[еі] вин[оа]|зброджен(і|ий) ігрист(і|ий) напо(ї|ій) на основі вина|\(шампанське\)|натуральн[іе][ ,]ігрист[іе]|вино ігристе)/)
          printLine("ІГРИСТЕ");
        else
          printLine("ТИХЕ");
      } else if (UKTZED~/(2204218900|2204219100)/)
        printLine("ТИХЕ_МІЦНЕ");

    } else
      printLine("ІНШЕ");
  }
}