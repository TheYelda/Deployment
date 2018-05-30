#! /bin/bash

yeldaDir='/public/home/yanzexin/yelda/'

wwwDir='/public/home/yanzexin/yelda/www/'
logDir='/public/home/yanzexin/yelda/log/'
photosDir='/public/home/yanzexin/yelda/photos/'
medicalImgaesDir='/public/home/yanzexin/yelda/medical-images/'
serverDir='/public/home/yanzexin/yelda/server/'

appFiles='/public/home/yanzexin/AppServer/server/.'
clientDir='/public/home/yanzexin/AppClient/static/'

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

