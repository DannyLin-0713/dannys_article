#!/bin/bash

# Published by Danny Lin； 本code由Danny Lin發佈
# 簡體中文版

echo -e "\033[47;30m Danny Lin 发布 \033[0m"
echo -e "\033[47;30m 发布日期 2020年4月1日 \033[0m"
echo -e "\033[47;30m 简体中文版 \033[0m"


#鍵入想被轉寫的檔案
echo -e "\033[32m 输入想转写为base64的音频、图片绝对路径，例如 /home/danny/test.jpg \033[0m"
	read dir

	#確認本檔案是否存在
	while [  ! -f $dir ];
		do
			echo -e "\033[41;37m 输入的图片、音频不存在，请确认后再输入一次 \033[0m"
			echo -e "\033[32m 输入想转写为base64的音频、图片绝对路径，例如 /home/danny/test.jpg \033[0m"
        		read dir
		done
	
	echo -e "\033[33m 已侦测到图片/音频，$dir 是否为您想转写为base64的音频或图片 （输入1回车表示正确 /输入2表示错误，回车后重新填写) \033[0m"
	read confirm_tp
	
#while 確認被轉寫檔案路徑是否正確
	
	while (($confirm_tp == 2))
		do
			echo -e "\033[32m 输入想转写为base64的音频、图片绝对路径，例如 /home/danny/test.jpg \033[0m"
			read dir
			

			while [  ! -f $dir ];
				do
                			echo -e "\033[41;37m 输入的图片、音频不存在，请确认后再输入一次 \033[0m"
                			echo -e "\033[32m 输入想转写为base64的音频、图片绝对路径，例如 /home/danny/test.jpg \033[0m"
                			read dir
				done


			echo -e "\033[33m 已侦测到图片/音频， $dir 是否为您想转写为base64的音频或图片 （输入1回车表示正确 /输入2表示错误，回车后重新填写) \033[0m"
			read confirm_tp
		done


#存儲路徑確認

echo -e "\033[32m 请键入储存转写结果的目录绝对路径。例如/home/danny_saving \033[0m"
	read target_dir

echo -e "\033[32m 请输入想储存在 $target_dir 中 base64转写结果的文档名。例如 Danny.base64 \033[0m"
	read target_name

echo -e "\033[43;30m 警告！若目标文档是既有文档，转写结果将直接写入文档内\033[0m"
echo -e "\033[33m 若目标目录、文档不存在，将自动创建 \033[0m"
echo -e "\033[33m 将被转写的图片/音频为 $dir \033[0m"
echo -e "\033[33m  $target_dir/$target_name 是否为储存base64转写结果的目录和文档名 ?（输入1回车表示正确 /输入2表示错误，回车后重新填写) \033[0m"	
	read confirm_result

	while (($confirm_result==2))
		do
			echo -e "\033[32m 请键入储存转写结果的目录绝对路径。例如/home/danny_saving \033[0m"
        			read target_dir

			echo -e "\033[32m 请输入想储存在 $target_dir 中 base64转写结果的文档名。例如 Danny.base64  \033[0m"
        			read target_name
			echo -e "\033[43;30m 警告！若目标文档是既有文档，转写结果将直接写入文档内\033[0m"
			echo -e "\033[33m 若目标目录、文档不存在，将自动创建 \033[0m"
			echo -e "\033[33m 将被转写的图片/音频为 $dir \033[0m"
			echo -e "\033[33m $target_dir/$target_name 是否为储存base64转写结果的目录和文档名 ?（输入1回车表示正确 /输入2表示错误，回车后重新填写) \033[0m"
        			read confirm_result

		done


#偵測存儲路徑

if [ ! -d $target_dir  ];then
	mkdir -p $target_dir
	echo -e "\033[33m 目标目录不存在，程序自动创建 \033[0m "
else
	echo -e "\033[32m 目标目录已侦测到 \033[0m"
fi


if [ ! -f $target_dir/$target_name  ];then
        touch $target_dir/$target_whole
        echo -e "\033[33m 目标文档不存在，程序自动创建 \033[0m"
else
        echo -e "\033[32m  目标文档已存在，程序自动写入结果 \033[0m"
fi

#結果提示和輸出
command cat $dir | base64 >> $target_dir/$target_name
echo -e "\033[32m 转写完成！请至 $target_dir/$target_name 查看转写结果 ；被转写的图片、音频为 $dir  \033[0m"
echo -e $(date) 转写完成！请至 $target_dir/$target_name 查看转写结果 ；被转写的图片、音频为 $dir >> ./convert_record.log

