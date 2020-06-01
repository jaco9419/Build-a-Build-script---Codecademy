#!/bin/bash
echo "Welcome to the coding experience"
#Read the first line of the changelog.md file
#By default, head returns 10 lines. But here, we want the first line. We can use the -n argument to specify the number of lines:
firstline=$(head -n 1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "Version:" $version
echo "Would you like to continue with the current version? (enter "1" for yes, "0" for no)"
read versioncontinue

if [ $versioncontinue -eq 1 ]
then
echo "OK"
#Use the wildcard * to access files within the source directory:
for file in source/*
do
if [ $file == "source/secretinfo.md" ]
then
echo "Not copying:" $file
else
echo "Copying:" $file
cp $file build/.
fi
done
cd build/
echo "Build version $version contains:"
ls
cd ..
else
echo "Please come back when you are ready"
fi
