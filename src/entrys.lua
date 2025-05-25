
function add_file_to_llm(already_added,llm,filename)
    filename = dtw.get_absolute_path(filename)
    if item_already_in_list(already_added,filename) then
        return  
    end 
    local text_to_insert = ""
    text_to_insert = filename..":\n"
    text_to_insert = text_to_insert.. dtw.load_file(filename) .. "\n"
    text_to_insert = text_to_insert .."-----------------\n"
    print("adding to context:"..filename)
    llm.add_user_prompt(text_to_insert)
    already_added[#already_added + 1] = filename    

end 

function add_dir_to_llm(already_added,llm,dir)
    local all_files = dtw.list_files_recursively(dir,true)
    for j=1,#all_files do
        local current_file = all_files[j]
        add_file_to_llm(already_added,llm,current_file)
    end
end 

function add_path_to_llm(already_added,llm,current_entrie)
       
    if dtw.isfile(current_entrie) then
        add_file_to_llm(already_added,llm,current_entrie)
    elseif dtw.isdir(current_entrie) then
        add_dir_to_llm(already_added,llm,current_entrie)
    else 
        error("current entrie "..current_entrie.." its not a file or a dir")
    end 
end 

function configure_entries(llm)

    local alrady_added_files = {}
    local total_entries = argv.get_flag_size({ "entries","e" })
    for i = 1,total_entries do
        local current_entrie = remove_non_ascii_if_windows(argv.get_flag_arg_by_index({ "entries","e" }, i))
        add_path_to_llm(alrady_added_files,llm,current_entrie)
    end 
end
