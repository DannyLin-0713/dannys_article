#!/bin/bash

echo -e "\033[33m 台灣實時氣溫查詢 \033[0m"
echo -e "\033[33m 輸入1按Enter繼續，輸入任意鍵Enter以退出程式 \033[0m"
read work

while ((work==1))
do
	echo -e "\033[33m 台灣天氣查詢 \033[0m"
	echo -e "\033[33m 可選擇的大區：Kaohsiung，Taipei，Taiwan \033[0m"
	echo -e "\033[33m 請輸入您要選擇的大區英文名：Kaohsiung（高雄市）,Taipei（臺北市）,Taiwan（臺灣省）\033[0m"
		read state
	echo -e "\033[33m 您輸入的大區為 $state ，開始解析大區内可查詢的城市...... \033[0m"

	options_state=$(command curl --location -s --request GET "api.airvisual.com/v2/cities?state=$state&country=Taiwan&key=cb5e309d-b349-4fd0-a852-0e3c40258d0b" |python -m json.tool  | grep city)

	echo -e "\033[32m$options_state \033[0m"

#echo $state_options

	echo -e "\033[32m 若列表中有New Taipei，請以Taipei代替 \033[0m"
	echo -e "\033[32m 請在上述列表中，選擇要查詢的城市，輸入下方空格中按Enter;若列表中有New Taipei，請以Taipei代替 \033[0m"
	read city

	echo -e "\033[33m 您輸入的城市為 $city ，開始查詢城市實時氣溫...... \033[0m"

	options_city=$(command curl --location -s --request GET "https://api.airvisual.com/v2/city?city=$city&state=$state&country=Taiwan&key=cb5e309d-b349-4fd0-a852-0e3c40258d0b" |python -m json.tool | grep tp) 

	result_pre=$(echo $options_city)
	result=${result_pre:6:2}
	command echo -e "\033[43;30m 位於臺灣$state的$city 實時氣溫為$result攝氏度 \033[0m"
sleep 1

	echo -e "\033[33m 輸入1按Enter繼續查詢，輸入任意鍵Enter以退出程式 \033[0m"
        read work

done
