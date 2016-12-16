#!/bin/sh
apt-get update
echo $1 | sudo -S sudo apt-get install qt5-default
echo $1 | sudo -S sudo apt-get install libqt5webkit5-dev
echo $1 | sudo -S sudo apt-get install libqt5xmlpatterns5-dev
echo $1 | sudo -S sudo apt-get install libssl-dev
echo $1 | sudo -S sudo apt-get install libsecret-1-dev
echo $1 | sudo -S sudo apt-get install freeglut3-dev
echo $1 | sudo -S sudo apt-get install git
cd ../sdk
qmake
make
cd ../samples
qmake
make
cd ../bin
export LD_LIBRARY_PATH=`pwd`
cd tests
./rmscryptoUnitTests -xunitxml > rmsUnitTestResults.txt
./rmsauthUnitTests -xunitxml >> rmsUnitTestResults.txt
./rmsplatformUnitTests -xunitxml >> rmsUnitTestResults.txt
cd ../tools
powershell ./Rms_Sdk_For_Cpp_UTResults_Parser.ps1
