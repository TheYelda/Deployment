#! /bin/bash

yeldaDir='/root_path/yelda/'
serverUrl='https://github.com/TheYelda/AppServer.git'
staticUrl='https://github.com/TheYelda/AppClient/releases/download/1.0.7/dist.zip'
serverGit='/root_path/AppServer/'

wwwDir='/root_path/yelda/www/'
logDir='/root_path/yelda/log/'
photosDir='/root_path/yelda/photos/'
medicalImgaesDir='/root_path/yelda/medical-images/'
staticDir='/root_path/yelda/www/static/'

zipFile='/root_path/yelda/www/static/dist.zip'
distFiles='/root_path/yelda/www/static/dist/.'
appFiles='/root_path/AppServer/server/.'

echo -n 'Initializing directories...'
if [ -d ${wwwDir} ]; then
    rm -r ${wwwDir}
    mkdir ${wwwDir}
    mkdir ${staticDir}
fi
if [ ! -d ${logDir} ]; then
    mkdir ${logDir}
fi
if [ ! -d ${photosDir} ]; then
    mkdir ${photosDir}
fi
if [ ! -d ${medicalImagesDir} ]; then
    mkdir ${medicalImagesDir}
fi
echo 'Done'

echo -n 'Updating server ...'
git -C ${serverGit} pull
cp -r ${appFiles} ${wwwDir}
echo 'Done'

echo -n 'Updating client ...'
wget -P ${staticDir} ${staticUrl}
unzip -d ${staticDir} ${zipFile}
cp -r ${distFiles} ${staticDir}
echo 'Done'

