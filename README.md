# sh-scripts

nohup ./network_monitor.sh ./network_config.txt > network_monitor.log 2>&1 &
output: process id
tail -f network_monitor.log
