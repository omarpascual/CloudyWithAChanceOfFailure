# CloudyWithAChanceOfFailure
CSC468 Cloud Computing

Members: Omar Pascual, Ally McMullen, Connor Sadoff, Tekalegn Gemeda


Selected Projection:

Linpack: Solves a dense system of linear equations using an algorithm that carries out LU factorization with partial pivoting

Network Latency - netperf: The network request response benchmark can help measure report round-trip latency

Redis: High performance, rich API and widespreasd use among PaaS providers (e.g, amazon, Elasticache, google compute engine) |

MySQL: Widely used in the cloud that typically stresses memory, IPC, filesystem, and networking subsystem | Running normally on Linux (native) | Under Docker using host networking and a volume (Docker new = host volume), using a volume but normal Docker networking (Docker NAT volume), storing database within the container filesystem (Docker NAT AUFS), and running under KVM




#Running The Benchmarks
To run the benchmarks, cd into its respective folder in the Github repository and then run the following commands for the benchmark: 




LINPACK COMMANDS:
- docker build -t linpack .
- docker run linpack


MYSQL COMMANDS:
- docker build -t "mysql-single" .
- docker run --name mysql -d -p 3306:3306 -e MYSQL_PASS="password" tutum/mysql
- docker exec -it mysql bash
- mysql -uadmin -ppassword -h127.0.0.1 -P3306


NETPERF COMMANDS:
- sudo apt-get update
- sudo apt-get install -y netperf
- cp /usr/bin/netserver .
- docker build -t netserver .
- docker run -d -p 12865:12865 netserver
- Ifconfig (use etho0 IP address)
- ps -ef | grep netserver (to check if a netserver already running)
- netperf -l 60 -H [eth0 IP address] -t TCP_RR -- -r 100,200
- netperf -l 60 -H [eth0 IP address] -t UDP_RR -- -r 100,200


REDIS COMMANDS:
 - docker build -t redis .
 - docker run --name redis -d --publish 6379:6379 redis
 - docker exec -it redis bash
 - redis-benchmark --csv
 
