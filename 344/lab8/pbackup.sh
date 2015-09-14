if (($# < 2)); then
        echo "Correct Usage: partial_backup.sh <directory_name> <tarfile_name>"
else
directory=$1
tar=$2
fi

found=`find $directory -type f -mtime -1`
tar -cvf "$tar.tar" $found
gzip "$tar.tar"
                        

