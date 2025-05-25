

function item_already_in_list(list,item)
    for i=1,#list do 
        if list[i] == item then 
            return true 
        end 
    end 
    return false 
end 