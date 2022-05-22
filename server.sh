#!/bin/bash

echo -n "Is $(pwd) the correct working directory?(yes/no) "
read pwdresponse
# Check with user to make sure we are correct working directory

if [ "$pwdresponse" == "yes" ]; then
    echo -n "Enter new directory name: "
    read mkdirName1
    mkdir "$mkdirName1"
    cd "$mkdirName1/"
    touch server.js
    git init
    npm init
    npm i express
    echo -n "Setup git remote?(yes/no) "
    read remoteResponse
    if [ "$remoteResponse" == "yes" ]; then
    echo -n "Enter new remote origin(github url or ssh): "
    read remoteOrigin
    git remote add origin "$remoteOrigin"
    fi
fi
# Creates new directory, adds server.js file, inits git and npm, installs express and can setup github remote.

echo -n "Is EJS needed?(yes/no) "
read EJSresponse
if [ "$EJSresponse" == "yes" ]; then
    npm i ejs
    mkdir "models"
    mkdir "views"
    cd "models"
    touch "model.js"
    cd ..
    cd "views"
    until [ "$viewFile" == "stop" ]; do
    echo -n "Enter view.ejs file names (ex. index.ejs) and end with stop. "
    read viewFile
    if [ $viewFile != "stop" ]; then
    touch "$viewFile"
    fi
    done
fi
#creates the basic MVC file structure 

echo -n "Are Partials needed?(yes/no) "
read partialsResponse
if [ "$partialsResponse" == "yes" ]; then
    mkdir "partials"
    cd "partials"
    until [ "$partialsNames" == "stop" ]; do
    echo -n "Enter partials names (ex. header.ejs) and end with stop. "
    read partialsNames
    if [ "$partialsNames" != "stop" ]; then
        touch "$partialsNames"
    fi
done
    cd ..
    cd ..
fi
# adds partials if needed

echo -n "Is Public needed?(yes/no) "
read publicResponse
if [ "$publicResponse" == "yes" ]; then
    mkdir "public"
    cd "public"
    until [ "$publicNames" == "stop" ]; do
    echo -n "Enter public names (style.css) and end with stop. "
    read publicNames
    if [ "$publicNames" != "stop" ]; then
        touch "$publicNames"
    fi
done
    cd ..
fi
# adds public if needed

touch ".gitignore"
echo -n "Open new directory in VS Code?(yes/no) "
read vsCodeResponse
if [ "$vsCodeResponse" == "yes" ]; then
code .
fi
# opens vs code if wanted