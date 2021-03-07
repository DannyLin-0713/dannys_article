#!/bin/bash
echo -e "\033[33m 中国大陆实时天气查询 \033[0m"
echo -e "\033[33m 输入1回车以继续,输入任意键回车以退出 \033[0m"
read work

while (($work==1))
do
	echo -e "\033[33m 中国大陆天气查询 \033[0m"
	echo -e "\033[33m 省份(直辖市)查询...... \033[0m"

	options_country=$(command curl --location -s --request GET "api.airvisual.com/v2/states?&country=China&key=cb5e309d-b349-4fd0-a852-0e3c40258d0b" |python -m json.tool  | grep state)
	echo -e "\033[32m$options_country \033[0m"
	echo -e "\033[33m 省份（直辖市）查询完毕，请在下方输入您要选择的省份（直辖市）英文名：\033[0m"
		read state
	echo -e "\033[33m 您输入的省份（直辖市）为 $state ，开始解析省份（直辖市）内的查询的市级行政区...... \033[0m"

	options_state=$(command curl --location -s --request GET "api.airvisual.com/v2/cities?state=$state&country=China&key=cb5e309d-b349-4fd0-a852-0e3c40258d0b" |python -m json.tool  | grep city)

	echo -e "\033[32m$options_state \033[0m"

#echo $state_options

	echo -e "\033[32m 请在上述列表中选择要查询的城市，并且输入在下方空格中 \033[0m"
	read city

	echo -e "\033[33m 您输入的城市为 $city ，开始查询实时气温...... \033[0m"

	options_city=$(command curl --location -s --request GET "https://api.airvisual.com/v2/city?city=$city&state=$state&country=China&key=cb5e309d-b349-4fd0-a852-0e3c40258d0b" |python -m json.tool | grep tp) 

	result_pre=$(echo $options_city)
	result=${result_pre:6:2}
	command echo -e "\033[43;30m 位于中国$state省（市）的实时气温为$result摄氏度 \033[0m"
sleep 1
	echo -e "\033[33m 输入1回车以继续,输入任意键回车以退出 \033[0m"
	read work

done
