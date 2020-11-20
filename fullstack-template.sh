#!/usr/bin/env bash

outputDir=$(pwd)

cd "$outputDir" || return

# MAKE SERVER DIRECTORY
mkdir server && cd server || return
# MAKE SRC DIRECTORY FOR SERVER
mkdir src && cd src || return
# MAKE THE COMMON SERVER DIRECTORIES & FILES
echo -e "\e[1;33mCreating boiler plate server directories and files\e[0m"
mkdir routes database middleware models public
touch index.js
echo 'Full stack server template README' >> README.md
echo 'node_modules' >> .gitignore

# INITIALIZE GENERAL NPM PROJECT
echo -e "\e[1;33mInitializing npm project\e[0m"
npm init -y;

# INSTALL GENERAL NPM PACKAGES
echo -e "\e[1;33mInstalling dependencies\e[0m"
npm i --silent express cors body-parser dotenv;
echo -e "\e[1;33mInstalling development dependencies\e[0m"
npm i -D --silent nodemon;

echo -e "\e[1;33mSERVER TEMPLATE CREATED\e[0m"

cd ../../
# CREATE THE REACT APP
echo -e "\e[1;33mInstalling Create React App\e[0m"
npx create-react-app client;
cd client || return

# REMOVE BOILERPLATE FROM CREATE REACT APP
echo -e "\e[1;33mRemoving unused create-react-app boiler plate files\e[0m"
rm -r "$(pwd)"/src
mkdir src && cd src || return
# MAKE THE COMMON FRONT END DIRECTORIES
echo -e "\e[1;33mAdding general React App directories"
mkdir components utils pages styles
# ADD THE BOILERPLATE CODE TO index.js AND App.js
echo -e "\e[1;33mAdding boiler plate code to index.js and App.js\e[0m"
printf "import React from 'react'\n import ReactDOM from 'react-dom'\n import App from 'App.js'\n\n ReactDOM.render(<App />, document.querySelector('#root'));" > index.js
printf "import React from 'React'\n\n export const App = () => {\n return(\n<div>From Template</div>\n\n " > App.js

echo -e "\e[1;33mCLIENT TEMPLATE CREATED\e[0m"

