relative_load("system.lua")

-- do projeto e não do lua

if os_name == "windows" then 
end
-- Define color variables
local COLOR_GREEN = "\27[32m"
local COLOR_BLUE = "\27[34m"
local COLOR_RESET = "\27[0m"

-- Initialize an LLM with no system permissions (safe for chat-only use)
llm = newLLM({delete = true, write = true, list = true, delete = true})

-- Set a system prompt for the chatbot's behavior
configure_system(llm)
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
    -- Add user input as a prompt
    llm.add_user_prompt(user_input)

    -- Generate AI response
    response = llm.generate()
    llm.add_assistent_prompt(response) -- tell the llm to remember what it said

    -- Display AI response in blue
    print(COLOR_BLUE .. "AI: " .. response .. COLOR_RESET)
end
