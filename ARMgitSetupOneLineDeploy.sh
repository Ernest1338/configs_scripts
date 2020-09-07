# dependencies: wget, docker
# short one liner: wget -O - https://kutt.it/isQ9Ng | sh
wget https://raw.githubusercontent.com/Ernest1338/test_repo0002/master/ARMgitSetupDockerfile ; sudo docker build -t gitsetup - < ARMgitSetupDockerfile ; sudo docker run -d -t -P gitsetup
