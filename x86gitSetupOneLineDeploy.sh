# dependencies: wget, docker
# short one liner: wget -O - https://kutt.it/aMiOg8 | sh
wget https://raw.githubusercontent.com/Ernest1338/test_repo0002/master/x86gitSetupDockerfile ; docker build -t gitsetup - < x86gitSetupDockerfile ; docker run -d -t -P gitsetup
