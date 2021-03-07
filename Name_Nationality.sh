#!/bin/bash

#echo -e "\033[33m 判断英文名字为某籍贯的可能性 \033[0m"

echo -e "\033[33m 这个英文名字，哪个国家的人最爱用？:\033[0m"
echo -e "\033[33m 输入1回车继续程序，输入任意键回车退出程序\033[0m"
read work

while ((work==1))
do
	echo -e "\033[33m 请在下方输入英文名字，将会自动判断哪些地方的人最喜爱使用这个名字:\033[0m"
	read Name

	echo -e "\033[33m 您输入的名字为$Name\033[0m"
	echo -e "\033[33m 解析中.......................\033[0m"
	sleep 2 

	result=$(command curl -X GET -H 'Content-Type:application/json' -s --url https://api.nationalize.io?name=$Name | python -m json.tool | grep country_id )
#result2=$(command curl -X GET -H 'Content-Type:application/json' --url https://api.nationalize.io?name=$Name | python -m json.tool  | grep probability )


	Nation1=${result:27:2}  
#Rate1=${result2:29:2}

	Nation2=${result:59:2} 
#Rate2=${result2:76:2}

	Nation3=${result:91:2}
#Rate3=${result:0-20:2}

	echo -e "\033[32m 哪些地方的人最喜欢用$Name当作名字？加载中...... \033[0m"
	sleep 2

	echo -e "\033[32m 第1爱用$Name作名字的是 籍贯$Nation1的人 \033[0m"
	sleep 1

	echo -e "\033[32m 第2爱用$Name作名字的是 籍贯$Nation2的人 \033[0m"
	sleep 1

	echo -e "\033[32m 第3爱用$Name作名字的是 籍贯$Nation3的人 \033[0m"
	sleep 1

	echo -e "\033[33m 如果在路上碰到$Name，他（她）是$Nation1,$Nation2,$Nation3籍贯的概率分别为（按照排名先后，介于0-1之间） \033[0m"
	echo -e "\033[33m 读取中...... \033[0m"
	rate=$(command curl -X GET -H 'Content-Type:application/json' -s --url https://api.nationalize.io?name=$Name |python -m json.tool  | grep probability )
	echo -e "\033[32m$rate \033[0m"
sleep 1
	echo -e "\033[33m 输入1回车继续程序，输入任意键回车退出程序\033[0m"
	read work
done


#　　echo -e “\033[30m 黑色字 \033[0m” 
#　　echo -e “\033[31m 红色字 \033[0m” 
#　　echo -e “\033[32m 绿色字 \033[0m” 
#　　echo -e “\033[33m 黄色字 \033[0m” 
#　　echo -e “\033[34m 蓝色字 \033[0m” 
#　　echo -e “\033[35m 紫色字 \033[0m” 
#　　echo -e “\033[36m 天蓝字 \033[0m” 
#　　echo -e “\033[37m 白色字 \033[0m” 
#    echo -e “\033[40;37m 黑底白字 \033[0m” 
#　　echo -e “\033[41;37m 红底白字 \033[0m” 
#　　echo -e “\033[42;37m 绿底白字 \033[0m” 
#　　echo -e “\033[43;37m 黄底白字 \033[0m” 
#　　echo -e “\033[44;37m 蓝底白字 \033[0m” 
#　　echo -e “\033[45;37m 紫底白字 \033[0m” 
#　　echo -e “\033[46;37m 天蓝底白字 \033[0m” 
#　　echo -e “\033[47;30m 白底黑字 \033[0m” 
