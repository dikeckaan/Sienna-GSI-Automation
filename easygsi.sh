romurl='https://mva1.androidfilehost.com/dl/Tc69JV1sj7QCFPejxqRt4A/1598949800/8889791610682894384/xiaomi.eu_multi_HMK20ProMI9TPro_V12.0.3.0.QFKCNXM_v12-10.zip'
rombase='XIAOMI-EU'
devicecodename='davinci'
uploadto='wet'
toolkit='https://github.com/erfanoabdi/ErfanGSIs'

echo "Initializing environment"
sudo -E apt-get -qq update
sudo -E apt-get -qq install git openjdk-8-jdk wget
git clone --recurse-submodules "$toolkit" 

echo "Setting up ErfanGSI requirements"
sudo chmod -R 777 ErfanGSIs
cd ErfanGSIs
curl -sL https://git.io/file-transfer | sh
sudo bash setup.sh

echo "Download Stock Rom & Generate GSI"
sudo ./url2GSI.sh $romurl $rombase

echo "Zip Aonly and upload"
sudo chmod -R 777 output
cd output
zip -r $ZIP_NAME-GSI-Aonly.7z *-Aonly-*.img
curl -sL https://git.io/file-transfer | sh
clear
./transfer $uploadto $(devicecodename)-GSI-Aonly.7z

echo "Zip AB and upload"
zip -r $(ZIP_NAME-GSI)-AB.7z *-AB-*.img
./transfer $uploadto $(devicecodename)-GSI-AB.7z
