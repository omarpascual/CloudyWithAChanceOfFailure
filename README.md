# CloudyWithAChanceOfFailure
CSC468 Cloud Computing

Members: Omar Pascual, Ally McMullen, Connor Sadoff, Tekalegn Gemeda


Selected Projection:

CPU-PXZ: A parallel lossless data compression utility that uses the LZMA algorithm (Lempel-Ziv-Markov chain-Algorithm) It uses a dictionary compression scheme

Network Latency - netperf: The network request response benchmark can help measure report round-trip latency

Redis: High performance, rich API and widespreasd use among PaaS providers (e.g, amazon, Elasticache, google compute engine) |

MySQL: Widely used in the cloud that typically stresses memory, IPC, filesystem, and networking subsystem | Running normally on Linux (native) | Under Docker using host networking and a volume (Docker new = host volume), using a volume but normal Docker networking (Docker NAT volume), storing database within the container filesystem (Docker NAT AUFS), and running under KVM
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
# Create the docker image and container

docker build -t "mysql-single" .

# Run a container with that image

docker run -d -p 3307:3306 mysql-single

# Check the admin password

docker logs ff1cc6a87214

docker run -d --net=host -v  /home/acme-air/mysql-data:/home/mysql  mysql-single /bin/bash -c "/usr/bin/mysql_install_db"
  
