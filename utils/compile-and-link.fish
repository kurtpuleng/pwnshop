set filename $argv[1]

echo "compiling $filename in elf64 format..."
if nasm -f elf64 $filename -o $filename.o
    if ld $filename.o -o $filename.elf64
        if rm $filename.o
            echo -n "done!"
        else
            echo "FAIL! : rm $filename.o" 1>&2
        end
    else
        echo "FAIL! : ld $filename.o -o $filename.elf64" 1>&2
    end
else 
    echo  "FAIL! : nasm -f elf64 $filename -o $filename.o" 1>&2
end