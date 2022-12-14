#!/usr/bin/env bash

MII_TESTDATA_BASE_URL=https://github.com/medizininformatik-initiative/kerndatensatz-testdaten/raw/master/Test_Data/Vorhofflimmern
MII_TESTDATA_FILES=(VHF-Testdaten_01-VHF00001-VHF01000.json.zip VHF-Testdaten_01-VHF01001-VHF02000.json.zip VHF-Testdaten_01-VHF02001-VHF03000.json.zip VHF-Testdaten_01-VHF03001-VHF04000.json.zip VHF-Testdaten_01-VHF04001-VHF05000.json.zip\
 VHF-Testdaten_01-VHF05001-VHF06000.json.zip VHF-Testdaten_01-VHF06001-VHF07000.json.zip VHF-Testdaten_01-VHF07001-VHF08000.json.zip VHF-Testdaten_01-VHF08001-VHF09000.json.zip VHF-Testdaten_01-VHF09001-VHF10000.json.zip)

for file in "${MII_TESTDATA_FILES[@]}"
do
    wget "$MII_TESTDATA_BASE_URL/$file"
    unzip -o "$file" -d testdata
    rm "$file"
done
