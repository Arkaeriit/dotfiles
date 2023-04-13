
function edit_addr -d "Edit an address from an embedded firmware"
    if test (count $argv) -gt 0
        if arm-none-eabi-addr2line $argv[1] -e objs/app.elf > /dev/null 2> /dev/null
            arm-none-eabi-addr2line $argv[1] -e objs/app.elf | sed "s: .*::" | sed "s/:/ +/" | xargs vim
        else
            echo "Elf file or address invalid." > /dev/stderr
            return 2
        end
    else
        echo "Give an address, pretty please." > /dev/stderr
        return 1
    end
end

