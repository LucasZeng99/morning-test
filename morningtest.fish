function morningtest
    if not test -e "$PWD/test-cases"
        echo "not in a morning problem dir."
        return 1
    end

    touch "./a.out"
    rm -f "./a.out"
    
    g++ ./soln/*.cpp -o "./a.out" --std=c++17
    
    if not test -e "./a.out"
        echo "compile error."
        return 1
    end
     
    set outPath "./stdout.txt"
    set outputDir "test-outputs"

    rm -f "./$outPath"
    rm -rf "./$outputDir"
    mkdir $outputDir
    touch $outPath

    echo "successfully compiled."
    for el in (find $PWD/test-cases/*/Inputs/ -maxdepth 1 | grep txt | sort) 
        ./a.out < $el > $outPath
        set filename (echo $el | rev | cut -d "/" -f 1 | rev)
        set testid (echo $filename | cut -d "-" -f 1)
        
        set expectedContents (cat (find $PWD/test-cases/*/Expected/ -maxdepth 1 | grep $testid))
        set outputContents (cat $outPath)

        if [ (echo $expectedContents) = (echo $outputContents) ]
            printf "."
        else
            echo $testid "wrong."
            echo $outputContents > "./$outputDir/$testid-yours.txt"
            echo $expectedContents > "./$outputDir/$testid-expected.txt"
            echo (cat $el) > "./$outputDir/$testid-input.txt"
            rm -f "./$outPath"
            rm -f "./a.out"
            
            echo "###########"
            echo "input: "
            echo (cat $el)
            echo "expected: "
            echo $expectedContents
            echo "yours: "
            echo $outputContents
            return 1
        end
    end
    echo ""
    echo "no errors."
    rm -rf "./$outputDir" 
    rm -f "./$outPath"
    rm -f "./a.out"
    return 0
end
