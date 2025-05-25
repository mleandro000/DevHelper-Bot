

relative_load("system.lua")
relative_load("entrys.lua")
-- do projeto e não do lua


-- Define color variables
local COLOR_GREEN = "\27[32m"
local COLOR_BLUE = "\27[34m"
local COLOR_RESET = "\27[0m"

-- Function to initialize and configure LLM
function initialize_llm()

    -- Initialize an LLM with no system permissions (safe for chat-only use)
    local llm = newLLM({read=true,write=true,list=true,execute=true, delete = true})
    -- Set a system prompt for the chatbot's behavior
    configure_entries(llm) 
    configure_system(llm)
    return llm
end
function resset_terminal()
    -- Clear terminal based on OS
    if os_name == "windows" then 
        os.execute("cls")
    elseif os_name == "linux" then 
        os.execute("clear")
    end
end 

function show_response(response)
    local output = argv.get_flag_arg_by_index({ "output", "o" },1)
    if output then
        dtw.write_file(output, response)
        return 
    end 
    print(COLOR_BLUE .. "AI: " .. response .. COLOR_RESET)
end 

function main()

    -- Initialize LLM using the function
    local llm = initialize_llm()


    if argv.flags_exist({ "prompt", "p" }) then
        local prompt = argv.get_flag_arg_by_index({ "prompt", "p" },1)
        llm.add_user_prompt(prompt)      
        local response = llm.generate()
        show_response(response)
        return 
    end


    -- Start chat mode 
    if os_name == "windows" then 
        os.execute("chcp 65001")
    end
    resset_terminal()

    -- Start an infinite loop for user interaction
    while true do

        -- Prompt user for input with a green color
        io.write(COLOR_GREEN .. "User: " .. COLOR_RESET)
        io.flush()

        -- Read user input
        local user_input  = io.read("*l")
    
        if  user_input == "exit" then 
            break
        end
        if user_input == "reset" then
            llm = initialize_llm()
            resset_terminal()
            goto continue
        end
        -- Add user input as a prompt
        llm.add_user_prompt(user_input)

        -- Generate AI response
        response = llm.generate()
        llm.add_assistent_prompt(response) -- tell the llm to remember what it said

        -- Display AI response in blue
        print(COLOR_BLUE .. "AI: " .. response .. COLOR_RESET)
        ::continue::
    end
end 

main()