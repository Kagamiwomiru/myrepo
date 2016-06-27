#!/bin/bash

#  Created by Kagami on 2016/06/05.
#
function InNum(){ #ファイルナンバー入力処理
echo "[コンパイルして実行]"
echo ">ファイルナンバーを入力。(-eでファイル名設定、-qでスクリプトを終了。)"
echo ">例:"${name}"??.c"
read num
if [ "$num" = "-e" ];then
echo "ファイル名設定に戻ります。"
echo ""
break
fi

if [ "$num" = "-q" ];then
exit 0
fi


JugeName #ファイル存在判定

}

function JugeName(){
if [ ! -e ${name}${num}.c ];then

echo "${name}${num}.cが見つかりませんでした。"
echo ""
InNum
fi

}

echo ""

echo "----コンパイル支援スクリプト for ゼミ Ver1.2.1----"
echo "[注意]"
echo "このスクリプトでは、実行時にプログラム引数を使用することができません。"
echo "プログラム引数を使用する場合は、一旦本スクリプトでコンパイルし、別ターミナルで直接実行してください。"
echo ""
while :
do
echo "[ファイル名設定]"
echo ">ファイル名を入力（例:work)"
read name
echo "ファイル名:"${name}
echo "ファイル名設定が完了しました。"
echo ""
while :
do

InNum #コンパイルして実行
echo ${name}${num}".cをコンパイルします。"
echo "------------実行結果-------------"
cc -o ${name}${num} ${name}${num}.c
./${name}${num}


echo "------------実行完了-------------"
echo ""


done
done
exit 0


