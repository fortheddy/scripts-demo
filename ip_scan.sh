#! /bin/bash

# 从iplist.txt文件中读取所有要ping的ip
# 未被使用的ip被写入到ip_can_use.txt文件中

for i in $(cat iplist.txt)
do
	ping -c 1 $i
# $?表示生一次命令执行的结果，当命令运行成功时返回0.当执行失败时返回1
# 当$?值为1时说明不能ping通，ip未被使用
	if [[ $? == 1 ]]; then
		echo $i >> ip_can_use.txt
	fi
done
