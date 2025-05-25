

function subscribe_entrie()
    local path = argv.get_flag_arg_by_index({ "path","p" },1)
    if not path then 
        print("--path not provided")
        return 
    end 
    if not dtw.isdir(path) and not dtw.isfile(path) then 
        print("--path:"..path.." its not a file  or a dir")
        return 
    end 

    local name = argv.get_next_unused()
    if not name then 
        print("name of entrie not provided ")
        return 
    end 
    local entries = get_prop("devbot_entries",{})
    for i=1,#entries  do 
        local current = entries[i]
        if current.name == name then 
            return 
        end 
    end 
    entries[#entries +1] = {
        name = name,
        path=path
    }
    set_prop("devbot_entries",entries)
end 

function list_entries()
    local entries = get_prop("devbot_entries",{})
    for i=1,#entries do
        local current = entries[i] 
        print("name:"..current.name)
        print("path:"..current.path)
        print("------------------------\n")
    end 
end 

