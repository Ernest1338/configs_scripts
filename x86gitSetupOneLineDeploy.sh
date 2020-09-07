# dependencies: wget, docker
wget https://raw.githubusercontent.com/Ernest1338/test_repo0002/master/x86gitSetupDockerfile ; docker build -t gitsetup - < x86gitSetupDockerfile ; docker run -d -t -P gitsetup
