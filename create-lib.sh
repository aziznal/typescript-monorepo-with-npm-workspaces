#!/bin/bash

echo "Creating a new typescript library"
echo ""

echo "Where do you want to create the library? (default = \"libs\")"
read path

if [ -z "$path" ]
then
    path="libs"
fi

echo "Enter library name: "
read libname

if [ -z "$libname" ]
then
    echo "You must enter a name for the library"
    exit 1
fi

echo ""
echo "Creating library $libname in $path ..."
echo ""

# 1. create folder
mkdir -p "$path/$libname"
cd "$path/$libname"

# 2. create package.json
echo "Creating package.json ..."
echo '{
  "name": "'$libname'",
  "version": "1.0.0",
  "main": "dist/index.js",
  "types": "dist/*/**.d.ts",
  "scripts": {
  "build": "tsc",
  "build:watch": "tsc --watch"
  },
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "typescript": "^5.1.6"
  }
}' > package.json

# 3. create tsconfig.json
echo "Creating tsconfig.json ..."
echo '{
  "compilerOptions": {
    "moduleResolution": "nodenext",
    "module": "commonjs",
    "baseUrl": "./",
    "outDir": "./dist",
    "lib": ["es6"],
    "declaration": true,
    "declarationMap": true,
    "target": "ES2021",
    "sourceMap": true,
    "skipLibCheck": true
  }
}' > tsconfig.json

# 4. create index.ts exporting example class from src/foo.ts
echo "Creating index.ts ..."
echo 'export { Foo } from "./src/foo";' > index.ts

# 5. create src folder
mkdir -p src
# 6. create src/foo.ts with an example class
echo 'export class Foo {
  constructor() {
    console.log("Hello from Foo");
  }
}' > src/foo.ts

# 7. run npm install in root folder where this script is located (ask user first)
echo "Do you want to install dependencies? (Y/n)"
read install

if [ -z "$install" ]
then
    install="y"
fi 

if [ "$install" = "y" ]
then
    echo "Installing dependencies ..."
    # Note: it's okay to run this script from any folder included in the npm workspaces array,
    # because npm workspaces will cause it to install dependencies in the root folder
    npm install
fi

echo ""
echo "Typescript library $libname created successfully! 🚀"
echo ""

echo "💡 Run 'npm run -w $libname build' to build the library once"
echo "💡 Run 'npm run -w $libname build:watch' to build the library on every change"

