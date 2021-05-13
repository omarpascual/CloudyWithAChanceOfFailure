COMMANDS:

sudo apt-get update
sudo apt-get install -y netperf
cp /usr/bin/netserver .

docker build -t netserver .
docker run -d -p 12865:12865 netserver

ps -ef | grep netserver (To check if server is alreading running)

netperf -l 60 -H (eth0 IP address) -t TCP_RR -- -r 100,200
netperf -l 60 -H (eth0 IP address) -t UDP_RR -- -r 100,200
