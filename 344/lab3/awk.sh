ps -ef > process.out
while read line ; do
        col8=`echo $line | awk '{i=8;while (NF>=i) {printf("%s ", $i);i++};printf "\n"}'`
       col7=`echo $line | awk '{print$7}'`
       col7add=`echo $col7 | awk -F':' '{print $1 * 3600 + $2 * 60 + $3}'`
       #printf "$col7add\n"
        if [ "$col7add" -gt "0" ]
        then
                echo "$col8"
        fi
        
done < process.out 

rm process.out


