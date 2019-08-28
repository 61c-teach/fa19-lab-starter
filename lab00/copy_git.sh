#!/bin/bash
rm -rf ./git
cp -r ../.git ./git/
git add ./git
git commit -m "Added the git repo metadata to your lab00 folder"
git push origin master
