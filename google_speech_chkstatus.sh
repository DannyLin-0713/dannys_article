#!/bin/bash

#echo -e "\033[32m 請截取您提交轉寫時的name_id，以備查詢  \033[0m"
echo -e "\033[32m 請輸入您的轉寫name_id，以開始查詢  \033[0m"
read name_get

while true 
do
	echo -e "\033[32m 進行實時查詢，每60秒追蹤1次轉寫進度和結果；若要終止追蹤，請按ctrl+c退出.........  \033[0m"
	echo -e 若要終止追蹤，請按ctrl+c退出
	echo -e 追蹤完成，且結果成功展示後，請至本目錄result.log查看轉寫結果
	echo -e "\033[33m 若音頻較長，不建議實時追蹤，稍作等待後再查詢.........  \033[0m"
        #curl -X GET -H "Content-Type: application/json; charset=utf-8" --url https://speech.googleapis.com/v1/operations/$name_get/?key=AIzaSyCU0JH_puxqz0Nk6JP4d2JZG7UvFY4i9GA
	chk=$(command curl -X GET -H "Content-Type: application/json; charset=utf-8" -s --url https://speech.googleapis.com/v1/operations/$name_get/?key=AIzaSyCU0JH_puxqz0Nk6JP4d2JZG7UvFY4i9GA)
	echo $chk | python -m json.tool| grep Percent
	echo $chk | python -m json.tool| grep transcript
result_log=$(echo $chk | python -m json.tool| grep transcript)
	echo $(date)  >> ./result.log
	echo $result_log >>./result.log
	sleep 60
done
