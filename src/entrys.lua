
function configure_entries(llm)

    local text_to_insert = "files:\n"
    local total_entries = argv.get_flag_size({ "entries","e" })
    for i = 1,total_entries do
        local current_entrie = argv.get_flag_arg_by_index({ "entries","e" }, i)
        if dtw.isfile(current_entrie) then
            text_to_insert = "file: " .. current_entrie.."\n"
            text_to_insert = text_to_insert.. dtw.load_file(current_entrie) .. "\n"
            text_to_insert = text_to_insert .."-----------------\n"
        end 
        if dtw.isdir(current_entrie) then
            local all_files = dtw.list_files_recursively(current_entrie,true)
            for j=1,#all_files do
                local current_file = all_files[j]
                text_to_insert = text_to_insert .. "file: " .. current_file.."\n"
                text_to_insert = text_to_insert.. dtw.load_file(current_file) .. "\n"
                text_to_insert = text_to_insert .."-----------------\n"
            end
        end
    end 
    llm.add_user_prompt(text_to_insert)
end
