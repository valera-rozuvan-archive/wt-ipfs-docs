#!/bin/bash

set -o errexit
set -o pipefail

function hndl_SIGHUP() {
  echo "Unfortunately, the script received SIGHUP..."
  exit 1
}
function hndl_SIGINT() {
  echo "Unfortunately, the script received SIGINT..."
  exit 1
}
function hndl_SIGQUIT() {
  echo "Unfortunately, the script received SIGQUIT..."
  exit 1
}
function hndl_SIGABRT() {
  echo "Unfortunately, the script received SIGABRT..."
  exit 1
}
function hndl_SIGTERM() {
  echo "Unfortunately, the script received SIGTERM..."
  exit 1
}

trap hndl_SIGHUP  SIGHUP
trap hndl_SIGINT  SIGINT
trap hndl_SIGQUIT SIGQUIT
trap hndl_SIGABRT SIGABRT
trap hndl_SIGTERM SIGTERM

# ----------------------------------------------------------------------------------------------

echo "Cleanup..."
rm -rf ~/org.id-sdk-ipfs-docs
rm -rf ~/build
rm -rf ./output_ipfs.log

echo "Create build dir..."
mkdir -p ~/build

echo "Cloning repo..."
cd ~/
git clone https://github.com/valera-rozuvan/org.id-sdk-ipfs-docs.git

echo "Resolving all git submodules..."
cd ~/org.id-sdk-ipfs-docs
git submodule init
git submodule update

echo "Building docs site..."
cd ~/org.id-sdk-ipfs-docs/org.id-sdk/docs
mkdir ./temp
yarn install
yarn build
cp --recursive ./build ~/build/
cp --recursive ./assets ~/build/
cp ./index.html ~/build/

echo "Adding new files to IPFS..."
cd ~/
ipfs add -r ./build > ./output_ipfs.log 2>&1

echo "Getting new IPFS hash..."
NEW_IPFS_HASH="$(grep --line-buffered -i 'added [a-z0-9]* build$' output_ipfs.log | awk '{print $(NF-1)}')"
echo "New IPFS hash is ${NEW_IPFS_HASH} - please update DNS!"

echo "Updating IPNS..."
ipfs name publish $NEW_IPFS_HASH

echo "Done!"
exit 0
