#! /bin/bash

yeldaDir='/home/ace/yelda/'
serverUrl='https://github.com/TheYelda/AppServer.git'
staticUrl='https://github.com/TheYelda/AppClient/releases/download/1.0.7/dist.zip'
serverGit='/home/ace/AppServer/'

wwwDir='/home/ace/yelda/www/'
logDir='/home/ace/yelda/log/'
photosDir='/home/ace/yelda/photos/'
medicalImgaesDir='/home/ace/yelda/medical-images/'
staticDir='/home/ace/yelda/www/static/'

zipFile='/home/ace/yelda/www/static/dist.zip'
distFiles='/home/ace/yelda/www/static/dist/.'
appFiles='/home/ace/AppServer/server/.'

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

