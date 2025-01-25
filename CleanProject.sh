#!/bin/bash

#This simple script will help you clean your react-native project. this script is useful when 
#  (1) To fix the React Native Mistmatch error)
#  (2) Your project worked previously, but not in a different React Native version
#  (3) Package versions in the package.json file is broken
#  (4) Something is wrong with your ios/Podfile
#  (5) You have opened the metro bundler in the wrong folder
#  (6) You have changed your codebase to point to a different Firebase project
#  (7) You are encountering build issues in Xcode or Android Studio

read -p "Enter project name: " ProjectName
npm uninstall -g react-native-cli @react-native-community/cli
npx @react-native-community/cli init $ProjectName
cd $ProjectName

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
