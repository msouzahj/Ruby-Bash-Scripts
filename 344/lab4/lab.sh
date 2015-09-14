echo "Enter the name of your file > "
read name
touch $name

echo "Do you want to allow read permission? > "
read elsread
if [ $elsread == "yes" ]
then 
        chmod 400 $name
fi

echo "Do you want to allow write permission? > "
read write
if [ $write == "yes" ]
then
        if [ $elsread == "no" ]
        then
            chmod 200 $name
        else
            chmod 600 $name
        fi
fi
echo "Do you want to allow execute permission? > "
read execute
if [ $execute == "yes" ]
then
        if [ $write == "no" ]
        then
                if [ $elsread == "no" ]
                then
                        chmod 100 $name
                else
                        chmod 500 $name
                fi
        elif [ $write == "yes" ]
        then
                if [ $elsread == "no" ]
                then
                        chmod 300 $name
                else
                        chmod 700 $name
                fi
        fi             
fi
