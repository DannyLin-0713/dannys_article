#!/bin/bash

echo -e "\033[33m Google Speech 轉寫App；Provided by Danny Lin  \033[0m"
echo -e 請先至本目錄下google.json配置轉寫詳細信息
sleep 2
echo -e "\033[32m 若配置完成，請輸入本次轉寫專案名（例如：王總演講），然後Enter繼續  \033[0m"
read speech_pj

#while ((continue_ok==1 ))
#do
	echo -e "\033[32m 準備完成......  \033[0m"
		echo -e "\033[32m 開始轉寫......  \033[0m"
	get_trans=$(command curl -H "Content-Type: application/json" -d '@./google.json' -s --url https://speech.googleapis.com/v1/speech:longrunningrecognize?key=AIzaSyCU0JH_puxqz0Nk6JP4d2JZG7UvFY4i9GA | grep name)
	get_id_accu=${get_trans:10:23}
	echo -e 您的轉寫name_id為"\033[33m $get_id_accu \033[0m" 請牢記
	echo -e 本次轉寫專案名為 "\033[32m "$speech_pj" \033[0m"
	echo -e 可至本目錄下"\033[33m Name_get_record文件 \033[0m"查看id獲取記錄
	echo -e "\033[33m 獲取id后，請在本目錄下執行google_speech_chkstatus.sh，以偵測轉寫進度，以及獲取轉寫結果  \033[0m"
	echo -e  $(date) 您的轉寫id、專案名為 "\033[32m $get_id_accu，$speech_pj  \033[0m" >>./Name_get_record

	
#	echo -e "\033[32m 開始查詢轉寫結果.......  \033[0m"
#	curl -X GET -H "Content-Type: application/json; charset=utf-8" --url https://speech.googleapis.com/v1/operations/5612332969317979368/?key=AIzaSyCU0JH_puxqz0Nk6JP4d2JZG7UvFY4i9GA | grep transcript >> 0406.txt

#done
