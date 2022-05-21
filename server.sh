#!/bin/bash

echo "Is $(pwd) the current directory?"
read pwdresponse
if [ $pwdresponse = "yes" ]; then
    echo "Enter new directory name: "
    read mkdirName1
    mkdir "$mkdirName1"
    cd "$mkdirName1/"
    touch server.js
    git init
    npm i express
fi
echo "Is EJS needed?"
read EJSresponse
if [ $EJSresponse = "yes" ]; then
    npm i ejs
    mkdir "models"
    mkdir "views"
    cd "models"
    touch "model.js"
    cd ..
    cd "views"
    until [ $viewFile = "stop" ]; do
    echo "Enter view.ejs file names and end with stop"
    read viewFile
    if [ $viewFile != "stop" ]; then
    touch "$viewFile"
    fi
    done
fi
echo "Are Partials needed?"
read partialsResponse
if [ $partialsResponse = "yes" ]; then
    mkdir "partials"
    cd "partials"
    until [ $partialsNames = "stop" ]; do
    echo "Enter partials names and end with stop"
    read partialsNames
    if [ $partialsNames != "stop" ]; then
        touch "$partialsNames"
    fi
done
    cd ..
    cd ..
fi
echo "Is Public needed?"
read publicResponse
if [ $publicResponse = "yes" ]; then
    mkdir "public"
    cd "public"
    until [ $publicNames = "stop" ]; do
    echo "Enter public names and end with stop"
    read publicNames
    if [ $publicNames != "stop" ]; then
        touch "$publicNames"
    fi
done
    cd ..
fi
touch ".gitignore"
echo "Open new directory in VS Code? "
read vsCodeResponse
if [ $vsCodeResponse != "yes" ]; then
code .
fi