chmod u-rwx $1
if [ "$2" == "write" -o "$3" == "write" -o "$4" == "write" ]
then
        chmod u+w $1
fi
if [ "$2" == "read" -o "$3" == "read" -o "$4" == "read" ]
then
        chmod u+r $1
fi
if [ "$2" == "execute" -o "$3" == "execute" -o "$4" == "execute" ]
then
        chmod u+x $1
fi




