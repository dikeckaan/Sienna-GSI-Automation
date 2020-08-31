romurl='https://oxygenos.oneplus.net/OnePlus8ProOxygen_15.O.22_OTA_022_all_2008080055_6e4f8eb44c10429a.zip'
rombase='OxygenOS'
devicecodename='op8pro'
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
mkdir romishere
cd romishere
sudo wget $romurl
mv * firmware.zip
cd ..
mv romishere/firmware.zip firmware.zip
wget https://raw.githubusercontent.com/dikeckaan/Sienna-GSI-Automation/master/merge.sh
chmod +x merge.sh
chmod +x make.sh
sudo ./merge.sh $OxgenOS firmware.zip
sudo ./make.sh cache/system-new $rombase Aonly /output
sudo ./make.sh cache/system-new $rombase AB /output
zip -r $devicecodename-GSI-Aonly.7z *-Aonly-*.img
zip -r $devicecodename-GSI-AB.7z *-AB-*.img
