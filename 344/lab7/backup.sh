if (($# < 3)); then
        echo "Correct Usage: partial_backup.sh <directory_name> <tarfile_name>"
        exit 1
else
search=$1
directory=$2
tar=$3
fi

found=`find $directory -name "*$search*"`

tar -cvf "$tar.tar" $found

gzip "$tar.tar"
