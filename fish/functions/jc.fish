# Alias for java compilation

function jc -d "compile java"
    echo "javac *.java" && javac *.java $argv
end
