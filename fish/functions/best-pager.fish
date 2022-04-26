# Return the name of the pager I would enjoy the most

function best-pager
    if command -v bat > /dev/null
        echo bat --tabs 4 --style=header,grid --decorations auto --color always --paging auto --theme Nord --wrap never
    else
        if command -v less > /dev/null
            echo less
        else
            echo more
        end
    end
end

