echo "Zip AB and upload"
cd ErfanGSI
sudo chmod -R 777 output
cd ErfanGSI/output
./transfer $uploadto $devicecodename-GSI-AB.7z
