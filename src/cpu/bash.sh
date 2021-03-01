#!/usr/bin/env bash
# to monitor used CPU
record=0
while true;
do
cpu=$(top -b -n1 | grep "node" | head -1 | awk '{print $9}')
pid=$(top -b -n1 | grep "node" | head -1 | awk '{print $1}')
#cpu check
result=${cpu/.*}
if [[ $record == $pid ]];then kill -9 $pid;echo "$pid was killed";fi
if [[ $result > 95 || $result == 100 ]];then let record=${pid};else let record=0;fi
#mem check
mem=$(free -m | awk 'NR==2 {print $3}')
if [[ $mem > 3638 ]];then apache-restart;echo "$mem is out 95%,so the httpd restart";fi
#echo
echo `date +%F" "%H:%M:%S`+" cpu:$result% record pid:$record pid:$pid"
sleep 20
done