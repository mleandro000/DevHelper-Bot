relative_load("colors.lua")
relative_load("system.lua")
relative_load("entrys.lua")
relative_load("actions/chat.lua")
relative_load("actions/prompt.lua")
relative_load("actions/entrie_actions.lua")

-- do projeto e não do lua

-- Function to initialize and configure LLM
function initialize_llm()

    -- Initialize an LLM with no system permissions (safe for chat-only use)
    local llm = newLLM({read=true,write=true,list=true,execute=true, delete = true})
    -- Set a system prompt for the chatbot's behavior
    configure_entries(llm) 
    configure_system(llm)
    return llm
end



function remove_non_ascii_if_windows(str)
   if os_name == "windows" then 
        return (str:gsub("[^\0-\127]+", ""))
   end 
   return str
end


function main()

    -- Initialize LLM using the function
    -- Start chat mode 
    if os_name == "windows" then 
        os.execute("chcp 65001")
    end

    if argv.flags_exist({ "prompt", "p" }) then
        return promt_action()
    end

    if argv.flags_exist({ "prompt_file", "pf" }) then
        return prompt_file_action()
    end

    local action = argv.get_next_unused()
    
    if action == "subscribe_entrie" then 
        return subscribe_entrie()
    end 
    if action == "list_entries" then 
        return list_entries()
    end 

    

    chat()



end 

main()
