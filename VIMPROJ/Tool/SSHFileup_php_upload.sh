#!/bin/sh

if [ $# -ne 5 ];then
	echo "argumemnt number err";
	read
	exit 0;
fi

export PATH=/usr/local/bin:/usr/bin:$PATH
WorkPath=`pwd`;
DIR=$WorkPath/$1;
REMOTEIP=$2
REMOTEPORT=$3;
REMOTEDIR=$4;
CHOICE=$5;

shell_type=`uname`;

if  [[ $shell_type =~ "CYGWIN" ]];then
	echo "oh~, Cygwin"

	if [ ! -d $DIR ];then
		echo "director "$DIR" not exist!!";
		read
		exit 0;
	fi


else 
	if [ ! -d $DIR ];then
		echo "director "$DIR" not exist!!";
		read
		exit 0;
	fi

	if ! [[ $REMOTEIP =~ '^.*[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*$' ]];then
		echo "remote ip( $REMOTEIP ) is not support!!";
		read
		exit 0;
	fi

	if ! [[ $REMOTEPORT =~ '^[0-9]+$' ]];then
		echo "REMOTEPORT: $REMOTEPORT is not a support port!!";
		read
		exit 0;
	fi

fi

TIMESTEMP=timestamp.txt
FILELIST=uploadfile.txt

cd $DIR;
count=0;
if [ -f "$FILELIST" ];then
	for i in `cat $FILELIST`; do
		n=$i;
        echo $n
		f=$DIR"/"$n;
		count=` expr $count + 1`;
		echo "scp -P $REMOTEPORT -rp $f $REMOTEIP:$REMOTEDIR/$n";
		scp -P $REMOTEPORT -rp $f "$REMOTEIP:$REMOTEDIR/$n";
	done
fi

##更改上传文件的权限
#ssh $REMOTEIP -p $REMOTEPORT remote_cmd=$REMOTEDIR 'bash -s' <<'ENDSSH'
#  # commands to run on remote host
#  cd $remote_cmd; pwd
#  find -type d -exec chmod 777 {} \;
#  find -type f -exec chmod 666 {} \;
#  find -type f -name "*.sh" -exec chmod 766 {} \;
#  find -type f -name "*.sh" -exec dos2unix  {} \; 2>/dev/null
#ENDSSH

touch $TIMESTEMP;

echo "upload file :"$count;
sleep 1;
read;
