echo "Zip Aonly and upload"
sudo chmod -R 777 ErfanGSI/output
cd ErfanGSI/output
zip -r ErfanGSI/$devicecodename-GSI-Aonly.7z *-Aonly-*.img
curl -sL https://git.io/file-transfer | sh
clear
./transfer $uploadto $devicecodename-GSI-Aonly.7z
