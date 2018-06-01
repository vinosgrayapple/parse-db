function printLine(TYPE){print "\""IMEXP FS INFO FS TYPE FS UKTZED FS COUNTRY_TRADE FS COUNTRY_OF_ORIGIN FS QUANTITY FS YEAR"\"";}
function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
function trim(s) { return rtrim(ltrim(s)); }
function red(s) {printf "\033[1;31m" s "\033[0m "}
function green(s) {return "\033[1;32m" s "\033[0m "}
function blue(s) {return "\033[1;34m" s "\033[0m "}

BEGIN {
  IGNORECASE = 1;
  FS = delim;
  country["EU"] = "ЄВРОПЕЙСЬКИЙ СОЮЗ (ЄС)";country["AF"] = "Афганістан";country["AL"] = "Албанія";country["AQ"] = "Антарктика";  country["DZ"] = "Алжир";country["AS"] = "Американське Самоа";  country["AD"] = "Андорра";country["AO"] = "Ангола";  country["AG"] = "Антигуа І Барбуда";country["AZ"] = "Азербайджан";  country["AR"] = "Аргентина";country["AU"] = "Австралія";  country["AT"] = "Австрія";country["BS"] = "Багамські Острови";  country["BH"] = "Бахрейн";country["BD"] = "Бангладеш";  country["AM"] = "Вірменія";country["BB"] = "Барбадос";  country["BE"] = "Бельгія";country["BM"] = "Бермудські Острови";  country["BT"] = "Бутан";country["BO"] = "Болівія";  country["BA"] = "Боснія І Герцеговина";country["BW"] = "Ботсвана";  country["BV"] = "Острів Буве";country["BR"] = "Бразилія";  country["BZ"] = "Беліз";country["IO"] = "Британська Територія В Індійському Океані";  country["SB"] = "Соломонові Острови";country["VG"] = "Віргінські Острови (Брит.)";  country["BN"] = "Бруней-Даруссалам";country["BG"] = "Болгарія";  country["MM"] = "М'Янма";country["BI"] = "Бурунді";  country["BY"] = "Білорусь";country["KH"] = "Камбоджа";  country["CM"] = "Камерун";country["CA"] = "Канада";  country["CV"] = "Кабо-Верде";country["KY"] = "Кайманові Острови";  country["CF"] = "Центральноафриканська Республіка";country["LK"] = "Шри-Ланка";  country["TD"] = "Чад";country["CL"] = "Чілі";  country["CN"] = "Китай";country["TW"] = "Тайвань, Провінція Китаю";  country["CX"] = "Острів Різдва";  country["CC"] = "Кокосові (Кілінг) Острови";  country["CO"] = "Колумбія";  country["KM"] = "Комори";  country["YT"] = "Майотта";  country["CG"] = "Конго";  country["CD"] = "Конго, Демократична Республіка";  country["CK"] = "Острови Кука";  country["CR"] = "Коста-Рика";  country["HR"] = "Хорватія";  country["CU"] = "Куба";  country["CY"] = "Кіпр";  country["CZ"] = "Чехія";  country["BJ"] = "Бенін";  country["DK"] = "Данія";  country["DM"] = "Домініка";  country["DO"] = "Домініканська Республіка";  country["EC"] = "Еквадор";  country["SV"] = "Сальвадор";  country["GQ"] = "Екваторіальна Гвінея";  country["ET"] = "Ефіопія";  country["ER"] = "Еритрея";  country["EE"] = "Естонія";  country["FO"] = "Фарерські Острови";  country["FK"] = "Фолклендські (Мальвінські) Острови";  country["GS"] = "Південна Джорджія Та Південні Сандвічеві Острови";  country["FJ"] = "Фіджі";  country["FI"] = "Фінляндія";  country["AX"] = "Аландські Острови";  country["FR"] = "Франція";  country["GF"] = "Французька Гвіана";  country["PF"] = "Французька Полінезія";  country["TF"] = "Французькі Південні Території";  country["DJ"] = "Джибуті";  country["GA"] = "Габон";  country["GE"] = "Грузія";  country["GM"] = "Гамбія";  country["PS"] = "Палестина";  country["DE"] = "Німеччина";  country["GH"] = "Гана";  country["GI"] = "Гібралтар";  country["KI"] = "Кірибаті";  country["GR"] = "Греція";  country["GL"] = "Гренландія";  country["GD"] = "Гренада";  country["GP"] = "Гваделупа";  country["GU"] = "Гуам";  country["GT"] = "Гватемала";  country["GN"] = "Гвінея";  country["GY"] = "Гаяна";  country["HT"] = "Гаїті";  country["HM"] = "Острів Герд І Острови Макдоналд";  country["VA"] = "Святий Престол (Держава-Місто Ватикан)";  country["HN"] = "Гондурас";  country["HK"] = "Гонконг";  country["HU"] = "Угорщина";  country["IS"] = "Ісландія";  country["IN"] = "Індія";  country["ID"] = "Індонезія";  country["IR"] = "Іран, Ісламська Республіка";  country["IQ"] = "Ірак";  country["IE"] = "Ірландія";  country["IL"] = "Ізраїль";  country["IT"] = "Італія";  country["CI"] = "Кот-Д'Івуар";  country["JM"] = "Ямайка";  country["JP"] = "Японія";  country["KZ"] = "Казахстан";  country["JO"] = "Йорданія";  country["KE"] = "Кенія";  country["KP"] = "Корейська Народно-Демократична Республіка";  country["KR"] = "Корея, Республіка";  country["KW"] = "Кувейт";  country["KG"] = "Киргизстан";  country["LA"] = "Лаоська Народно-Демократична Республіка";  country["LB"] = "Ліван";  country["LS"] = "Лесото";  country["LV"] = "Латвія";  country["LR"] = "Ліберія";  country["LY"] = "Лівія";  country["LI"] = "Ліхтенштейн";  country["LT"] = "Литва";  country["LU"] = "Люксембург";  country["MO"] = "Макао";  country["MG"] = "Мадагаскар";  country["MW"] = "Малаві";  country["MY"] = "Малайзія";  country["MV"] = "Мальдіви";  country["ML"] = "Малі";  country["MT"] = "Мальта";  country["MQ"] = "Мартиніка";  country["MR"] = "Мавританія";  country["MU"] = "Маврикій";  country["MX"] = "Мексика";  country["MC"] = "Монако";  country["MN"] = "Монголія";  country["MD"] = "Молдова";  country["ME"] = "Чорногорія";  country["MS"] = "Монтсеррат";  country["MA"] = "Марокко";  country["MZ"] = "Мозамбік";  country["OM"] = "Оман";  country["NA"] = "Намібія";  country["NR"] = "Науру";  country["NP"] = "Непал";  country["NL"] = "Нідерланди";  country["CW"] = "Кюрасао";  country["AW"] = "Аруба";  country["SX"] = "Сінт-Мартен (Нідерландська Частина)";  country["BQ"] = "Бонайре, Сінт-Естатіус І Саба";  country["NC"] = "Нова Каледонія";  country["VU"] = "Вануату";  country["NZ"] = "Нова Зеландія";  country["NI"] = "Нікарагуа";  country["NE"] = "Нігер";  country["NG"] = "Нігерія";  country["NU"] = "Ніуе";  country["NF"] = "Острів Норфолк";  country["NO"] = "Норвегія";  country["MP"] = "Північні Маріанські Острови";  country["UM"] = "Малі Віддалені Острови Сша";  country["FM"] = "Мікронезія, Федеративні Штати";  country["MH"] = "Маршаллові Острови";  country["PW"] = "Палау";  country["PK"] = "Пакистан";  country["PA"] = "Панама";  country["PG"] = "Папуа-Нова Гвінея";  country["PY"] = "Парагвай";  country["PE"] = "Перу";  country["PH"] = "Філіппіни";  country["PN"] = "Піткерн";  country["PL"] = "Польща";  country["PT"] = "Португалія";  country["GW"] = "Гвінея-Бісау";  country["TL"] = "Тимор-Лешті";  country["PR"] = "Пуерто-Рико";  country["QA"] = "Катар";  country["RE"] = "Реюньйон";  country["RO"] = "Румунія";  country["RU"] = "Російська Федерація";  country["RW"] = "Руанда";  country["BL"] = "Сен-Бартелемі";  country["SH"] = "Острів Святої Єлени";  country["KN"] = "Сент-Кітс І Невіс";  country["AI"] = "Ангілья";  country["LC"] = "Сент-Люсія";  country["MF"] = "Сен-Мартен (Французська Частина)";  country["PM"] = "Сен-П'Єр І Мікелон";  country["VC"] = "Сент-Вінсент І Гренадіни";  country["SM"] = "Сан-Марино";  country["ST"] = "Сан-Томе І Принсіпі";  country["SA"] = "Саудівська Аравія";  country["SN"] = "Сенегал";  country["RS"] = "Сербія";  country["SC"] = "Сейшельські Острови";  country["SL"] = "Сьєрра-Леоне";  country["SG"] = "Сингапур";  country["SK"] = "Словаччина";  country["VN"] = "В'Єтнам";  country["SI"] = "Словенія";  country["SO"] = "Сомалі";  country["ZA"] = "Південна Африка";  country["ZW"] = "Зімбабве";  country["ES"] = "Іспанія";  country["SS"] = "Південний Судан";  country["SD"] = "Судан";  country["EH"] = "Західна Сахара";  country["SR"] = "Суринам";  country["SJ"] = "Шпіцберген Та Ян-Маєн";  country["SZ"] = "Свазіленд";  country["SE"] = "Швеція";  country["CH"] = "Швейцарія";  country["SY"] = "Сирійська Арабська Республіка";  country["TJ"] = "Таджикистан";  country["TH"] = "Таїланд";  country["TG"] = "Того";  country["TK"] = "Токелау";  country["TO"] = "Тонга";  country["TT"] = "Тринідад І Тобаго";  country["AE"] = "ОАЕ";  country["TN"] = "Туніс";  country["TR"] = "Туреччина";  country["TM"] = "Туркменистан";  country["TC"] = "Острови Теркс І Кайкос";  country["TV"] = "Тувалу";  country["UG"] = "Уганда";  country["UA"] = "Україна";  country["MK"] = "Македонія";  country["EG"] = "Єгипет";  country["GB"] = "Велика Британія";  country["GG"] = "Гернсі";  country["JE"] = "Джерсі";  country["IM"] = "Острів Мен";  country["TZ"] = "Танзанія, Об'Єднана Республіка";  country["US"] = "Сполучені Штати Америки";  country["VI"] = "Віргінські Острови (США)";  country["BF"] = "Буркіна-Фасо";  country["UY"] = "Уругвай";  country["UZ"] = "Узбекистан";  country["VE"] = "Венесуела";  country["WF"] = "Уолліс І Футуна";  country["WS"] = "Самоа";  country["YE"] = "Ємен";  country["ZM"] = "Замбія";  country["ZK"] = "Вільна Економічна Зона Крим";
  }
##########################################################
##########################################################
{
  
if (type == "КОД_МИТНОГО_РЕЖИМУ") {#        2015 ГОД
        IMEXP = $1;        
        INFO = $17;
        UKTZED = $16;
        COUNTRY_TRADE = $28;
        COUNTRY_OF_ORIGIN = $29;
        QUANTITY = $20;
        FULL_DATE = $5;
    } else if (type == "ТИП_ВМД_НАПРАВЛЕНИЯ") {#        2016 ГОД
        IMEXP = $2;
        INFO = $19;
        UKTZED = $18;
        COUNTRY_TRADE = $35;
        COUNTRY_OF_ORIGIN = $36;
        QUANTITY = $22;
        FULL_DATE = $6;
    } else if (type == "ТИП_МД") {#        2017 ГОД
        IMEXP = $2;
        INFO = $17;
        UKTZED = $16;
        COUNTRY_TRADE = $20;
        COUNTRY_OF_ORIGIN = $20;
        QUANTITY = $25;
        FULL_DATE = $15;
    }
}
##########################################################
##########################################################
{
  split(FULL_DATE, a, ".");
  YEAR = a[3];



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

    gsub(/\"/, "", IMEXP);

    gsub(/i/, "і", COUNTRY_OF_ORIGIN);
    gsub(/i/, "і", COUNTRY_TRADE);

    gsub(/ /, "", QUANTITY);
    gsub(/\./, ",", QUANTITY);

    gsub(/"/, "", INFO);
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