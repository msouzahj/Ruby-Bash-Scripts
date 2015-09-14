ls /user/faculty/ > faculty.out
#filename='faculty.out'
while read line ; do
        item=`du -s  "/user/faculty/"$line 2> /dev/null | awk '{print$1}'`
        
        if [ "$item" -gt "100" ]
        then
            echo "$item $line" >> edit.out
            if [ "$item" -gt "1000" ]
            then
                    echo "$item $line" >>edit2.out
            fi
        fi
done < faculty.out
sort -g edit.out> sorted.out
sort -g edit2.out> sorted2.out

echo "Users having > 100Kb"
while read line ; do
       echo  $line
done < sorted.out

printf "\n"
#remmoving users with less than 1000
echo "User having > 1000Kb"
while read line ; do
        echo $line
done < sorted2.out

rm sorted.out
rm sorted2.out
rm edit.out
rm edit2.out
