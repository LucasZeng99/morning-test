function morning
    if not test -e "$PWD/test-cases"
        echo "not in a morning problem directory❓"
        return 1
    end

    touch "./a.out"
    rm -f "./a.out"
    
    g++ ./soln/*.cpp -o "./a.out" --std=c++17
    
    if not test -e "./a.out"
        echo "compile error💔 "
        return 1
    end
     
    set outPath "./stdout.txt"
    set outputDir "test-outputs"
    set timelimit 3
    rm -f "./$outPath"
    rm -rf "./$outputDir"
    mkdir $outputDir
    touch $outPath

    echo ""
    echo "compiled 🛠️  "

    for el in (find $PWD/test-cases/*/Inputs/ -maxdepth 1 | grep txt | sort) 
        timeout $timelimit ./a.out < $el > $outPath

        if test $status -eq 124
            printf "time limit exceeded: %ss\n" $timelimit
            return 1
        end

        if test $status -ne 0
            echo "runtime error"
            return 1
        end

        set filename (echo $el | rev | cut -d "/" -f 1 | rev)
        set testid (echo $filename | cut -d "-" -f 1)
        
        set expectedContents (cat (find $PWD/test-cases/*/Expected/ -maxdepth 1 | grep $testid))
        set outputContents (cat $outPath)

        if [ (echo $expectedContents) = (echo $outputContents) ]
            printf "."
        else
            echo "💥"
            echo $outputContents > "./$outputDir/$testid-yours.txt"
            echo $expectedContents > "./$outputDir/$testid-expected.txt"
            echo (cat $el) > "./$outputDir/$testid-input.txt"
            rm -f "./$outPath"
            rm -f "./a.out"
            

            printf "\ninput: \n"
            echo (cat $el)

            printf "\nexpected: \n"
            
            set_color green
            echo $expectedContents

            set_color normal
            printf "\nyours: \n"
            set_color red
            echo $outputContents
            return 1
        end
    end
    echo ""
    set_color green
    echo -e "all tests passed. 🚀"
    set_color normal
    rm -rf "./$outputDir" 
    rm -f "./$outPath"
    rm -f "./a.out"
    return 0
end
