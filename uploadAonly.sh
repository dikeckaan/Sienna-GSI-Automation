echo "Zip Aonly and upload"
cd ErfanGSI
sudo chmod -R 777 output
cd ErfanGSI/output
zip -r $devicecodename-GSI-Aonly.7z *-Aonly-*.img
./transfer $uploadto $devicecodename-GSI-Aonly.7z
