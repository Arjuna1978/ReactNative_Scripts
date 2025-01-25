#!/bin/bash

echo "Resetting your project may take a moment"

echo "Clearing watchman"
watchman watch-del-all

echo "clear android gradle"
android/gradlew clean

echo "removing package-locks"
rm -rf yarn.lock package-lock.json node_modules

echo "removing the android build"
rm -rf android/app/build



echo "removing the ios Podfile locks"
rm ios/Pods ios/Podfile.lock 

echo "refresshing the Xcode data"
rm -rf ~/Library/Developer/Xcode/DerivedData

echo "refreshing and updating pods"
npm install && cd ios && pod update && cd ..

echo "clearing npm pods"
npm start -- --reset-cache
