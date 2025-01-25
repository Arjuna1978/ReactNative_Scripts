#!/bin/sh

#setting up project using NPX

read -p "Enter project name: " ProjectName
npm uninstall -g react-native-cli @react-native-community/cli
npx @react-native-community/cli init $ProjectName
cd $ProjectName

# Creating a relatively standard directory structure
echo "Setting up project directory structure"
mkdir src
cd src
mkdir images
mkdir components
cd components
mkdir common
mkdir pages
cd common
mkdir hooks
cd ..
cd pages
mkdir home
cd ..
cd ..
cd ..

echo "moving App.tsx to the src folder"
# mv ./App.tsx ./src

echo "setting up local.properties"
cd android
touch local.properties

# getting current username
myUserName="$(whoami)"

echo "sdk.dir = /Users/$myUserName/Library/Android/sdk" >> local.properties
echo "cleaning Android Gradle"
./gradlew clean
cd ..

echo "updating pods"
gem install cocoapods
cd ios
pod install
pod install --repo-update
cd ..
cd android
cd ..
