function resset_terminal()
    -- Clear terminal based on OS
    if os_name == "windows" then 
        os.execute("cls")
    elseif os_name == "linux" then 
        os.execute("clear")
    end
end 


function chat()
    local llm = initialize_llm()

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