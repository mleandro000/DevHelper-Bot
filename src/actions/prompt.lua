function show_response(response)
    local output = argv.get_flag_arg_by_index({ "output", "o" },1)
    if output then

        dtw.write_file(remove_non_ascii_if_windows(output), response)
        return 
    end 
    print(COLOR_BLUE .. "AI: " .. response .. COLOR_RESET)
end 


function promt_action()
    local llm = initialize_llm()
    llm.add_system_prompt("dont ask user anything, just make what he is asking in a rentless behavior")
    local prompt = remove_non_ascii_if_windows(argv.get_flag_arg_by_index({ "prompt", "p" },1))
    llm.add_user_prompt(prompt)      
    local response = llm.generate()
    show_response(response)
    return 
end 


function prompt_file_action()
    local llm = initialize_llm()
    llm.add_system_prompt("dont ask user anything, just make what he is asking in a rentless behavior")
    local prompt_file = remove_non_ascii_if_windows(argv.get_flag_arg_by_index({ "prompt_file", "pf" },1))
    if dtw.isfile(prompt_file) then
        local prompt_content = dtw.load_file(prompt_file)
        llm.add_user_prompt(prompt_content)
        local response = llm.generate()
        show_response(response)
        return
    else
        error("Prompt file " .. prompt_file .. " does not exist")
    end
end 