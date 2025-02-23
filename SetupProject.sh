#!/bin/sh

#setting up project using NPX

read -p "Enter project name: " ProjectName
npx @react-native-community/cli@latest init $ProjectName
# Creating a relatively standard directory structure
cd $ProjectName
echo "Setting up project directory structure"
mkdir src
mkdir ./src/images
mkdir ./src/components
mkdir ./src/pages
mkdir ./src/hooks

echo "setting up local.properties"
echo "setting up local.properties"
touch ./android/local.properties
echo "sdk.dir = /Users/arjunavijayanayam/Library/Android/sdk" >> ./android/local.properties
echo "cleaning Android Gradle"
cd android
bash gradlew clean
cd ..
echo "updating pods"
gem install cocoapods
cd ios
pod install
pod install --repo-update
cd ..

