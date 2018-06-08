#! /bin/bash

yeldaDir='/root_path/yelda/'

wwwDir='/root_path/yelda/www/'
logDir='/root_path/yelda/log/'
photosDir='/root_path/yelda/photos/'
medicalImgaesDir='/root_path/yelda/medical-images/'
serverDir='/root_path/yelda/server/'

appFiles='/root_path/AppServer/server/.'
clientDir='/root_path/AppClient/static/'

echo -n 'Initializing directories...'
if [ -d ${wwwDir} ]; then
    rm -r ${wwwDir}
    mkdir ${wwwDir}
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

echo -n 'Copying files ...'
cp -r ${appFiles} ${wwwDir}
cp -r ${clientDir} ${wwwDir}
echo 'Done'

