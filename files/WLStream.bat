WLStream | plink -v your_IP -l username -pw password "cat - | pacat --latency-msec=1--playback --format float32le --rate 48000 --volume 65536"
