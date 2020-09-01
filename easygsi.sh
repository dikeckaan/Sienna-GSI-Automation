romurl='https://bigota.d.miui.com/20.8.27/miui_TUCANA_20.8.27_6540fa47cf_10.0.zip'
rombase='MIUI'
devicecodename='davinci'
uploadto='wet'
toolkit='https://github.com/erfanoabdi/ErfanGSIs'

echo "Initializing environment"
sudo apt-getupdate
sudo apt-get install -y git openjdk-8-jdk wget
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
