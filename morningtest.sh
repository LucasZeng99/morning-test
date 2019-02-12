#!/bin/bash

if [ ! -d ./test-cases ]; then
    echo "not in a morning problem directory."
    exit
fi

rm -f "./a.out"

g++ ./soln/*.cpp -o "./a.out" --std=c++17 || {
    echo "compile error."
    exit
}
echo "successfully compiled."

outPath="./stdout.txt"
outputDir="test-outputs"

rm -f "./$outPath"
rm -rf "./$outputDir"
mkdir $outputDir
touch $outPath

for el in $(find $PWD/test-cases/*/Inputs/ -maxdepth 1 | grep txt | sort); do
    ./a.out < $el > $outPath

    filename=$(echo $el | rev | cut -d "/" -f 1 | rev)
    testid=$(echo $filename | cut -d "-" -f 1)
    expectedContents=$(cat $(find $PWD/test-cases/*/Expected/ -maxdepth 1 | grep $testid))
    outputContents=$(cat $outPath)

    if [[ $(echo $expectedContents) == $(echo $outputContents) ]]; then
        printf "."
    else
        echo $testid "wrong."
        echo $outputContents > "./$outputDir/$testid-yours.txt"
        echo $expectedContents > "./$outputDir/$testid-expected.txt"
        echo $(cat $el) > "./$outputDir/$testid-input.txt"
        rm -f "./$outPath"
        rm -f "./a.out"
            
        echo "###########"
        echo "input: "
        echo $(cat $el)
        echo "expected: "
        echo $expectedContents
        echo "yours: "
        echo $outputContents
        
        exit
   fi
done
echo ""
echo "no errors."
rm -rf "./$outputDir" 
rm -f "./$outPath"
rm -f "./a.out"
