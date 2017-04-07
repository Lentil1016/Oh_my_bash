#!/bin/bash

function f()
{
	echo "hello world"
}

export -f f #导出函数

#判断命令是否执行成功
CMD="./sub_test.sh"
$CMD
if [ $? -eq 0 ];
then
	echo "$CMD executed successfully"
else
	echo "$CMD terminated unsuccessfully"
fi

#反引用
no=54
result=`echo "$no * 1.5" | bc`
echo $result

#光标控制、终端属性查询
tput cup 100 100
echo "cols:"
tput cols
echo "lines:"
tput lines
tput longname

#password
echo -e "Enter password: "
stty -echo
read password
stty echo
echo
echo Password read.
echo $password

#block
sleep 1;

#IFS
data="name,sex,rollno,location"
oldIFS=$IFS

IFS=,
for item in $data;
do
	echo Item: $item
done

IFS=$oldIFS

#[ -f $file_var ] 包含正常文件或路径名返回真
#[ -x $var ] 包含的文件可执行，则返回真
#[ -d $var ] 包含的是目录返回真
#[ -e $var ] 包含的文件存在返回真
#[ -c $var ] 包含字符设备文件返回真
#[ -b $var ] 包含一个块设备文件返回真
#[ -w $var ] 包含文件可写返回真
#[ -r $var ] 包含文件可读返回真
#[ -L $var ] 包含符号链接返回真
#[ -n str ] 字符串不为空时返回真

#Debugger
debug() {
    if [ "$debug_mode" -eq '1' ] && [ "$ret" -gt '1' ]; then
        msg "An error occurred in function \"${FUNCNAME[$i+1]}\" on line ${BASH_LINENO[$i+1]}, we're sorry for that."
    fi
}

#Mul_play
mkfifo pipe
script -f pipe
cat pipe


