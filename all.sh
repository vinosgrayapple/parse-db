#!/bin/bash
#2015##### awk -F"\";\"" '$1~/[ІI][МM]/ && $16~/(^2204.*|2206003900|2206005900)/{gsub(/\s+/," ",$0);gsub(/\x22;\x22/,"_____",$0);gsub(/\x3B/,"",$0);gsub(/\x22/,"",$0);gsub(/_____/,"\x22;\x22",$0);gsub(/(^|$)/,"\"",$0);gsub(/ \x22/,"\x22",$0);print}' 2015_Import-Export*.csv > 2015_2.csv
#2016##### awk -F"\";\"" '$2~/[ІI][МM]/ && $18~/(^2204.*|2206003900|2206005900)/{gsub(/\s+/," ",$0);gsub(/\x22;\x22/,"_____",$0);gsub(/\x3B/,"",$0);gsub(/\x22/,"",$0);gsub(/_____/,"\x22;\x22",$0);gsub(/(^|$)/,"\"",$0);gsub(/ \x22/,"\x22",$0);print}' ../2016\ import-export/2016_Import_Export\ *.csv > 2016_2.csv
#2017##### awk -F"\";\"" '$2~/[ІI][МM]/ && $16~/(^2204.*|2206003900|2206005900)/{gsub(/\x3Bnull/,"",$0);gsub(/\s+/," ",$0);gsub(/\x22;\x22/,"_____",$0);gsub(/\x3B/,"",$0);gsub(/\x22/,"",$0);gsub(/_____/,"\x22;\x22",$0);gsub(/(^|$)/,"\"",$0);gsub(/ \x22/,"\x22",$0);print}' ../2017\ import/2017_Import\ *.csv > 2017_2.csv
SETCOLOR_SUCCESS="echo -en \\033[1;32m"
SETCOLOR_FAILURE="echo -en \\033[1;31m"
SETCOLOR_NORMAL="echo -en \\033[0;39m"
#### VAR  ####
parse_program=_parse_.awk
output=all_tets.csv
DELIM="\";\""
##############
[ $# -eq 0 ] && { echo "Используйте: $0 'files for parsing'"; exit 1; }

if [ ! -e $parse_program ]
then 
$SETCOLOR_FAILURE
echo "Не найдена программа обработки базы =>  $parse_program" >&2
$SETCOLOR_NORMAL
#  
exit 1
fi
# 
# Head output file
echo $( sed 1q _parse_.awk | awk -F"\"" '{print $4}' | sed 's/ FS /\";\"/g'| awk -F" FS " '{print "\""$0"\""}') > $output


for file_for_parsing in "$@"
do
d=$(sed 1q $file_for_parsing | awk -F"\";\"" '{tmp=$2;gsub(/ /,"_",tmp);print toupper(tmp)}')

if [[ "$d" == "КОД_МИТНОГО_РЕЖИМУ" ]] 
then 
awk -v delim=$DELIM -v type="$d" -f $parse_program $file_for_parsing  >> $output
elif [[ "$d" == "ТИП_ВМД_НАПРАВЛЕНИЯ" ]] 
then
awk -v delim="$DELIM" -v type="$d" -f $parse_program $file_for_parsing  >> $output
elif [[ "$d" == "ТИП_МД" ]]
then
awk -v delim="$DELIM" -v type="$d" -f $parse_program $file_for_parsing  >> $output
fi 
#echo -e "Обрабатывается $file_for_parsing   ..."
if [ $? -eq 0 ]; then
    $SETCOLOR_SUCCESS
    echo -n "$file_for_parsing $(tput hpa 200)$(tput cub 6)[OK]"
    # echo -n "$file_for_parsing $(tput hpa $(tput cols))$(tput cub 6)[OK]"
    echo
    $SETCOLOR_NORMAL
    echo
else
    $SETCOLOR_FAILURE
    echo -n "$file_for_parsing $(tput hpa 200))$(tput cub 6)[fail]" >&2
    echo
    $SETCOLOR_NORMAL
    echo
fi
done
echo -e "\033[1;35m===================================\033[0m"
echo -e "Ищем в папкке: \033[1;33m$(pwd)\033[0m"
echo -e "Использовали программу: \033[1;32m$parse_program\033[0m"
echo -e "Получили файл: \033[1;31m$output\033[0m"
echo -e "\033[1;35m===================================\033[0m"
echo "DONE."
echo
PS3='Выберите действие: '

select act in "Выйти" "Открыть файл $output"
do
case "$act" in
 "Выйти" )
 ;;
 "Открыть файл $output" )
 start $output
 ;;
esac
break
done
