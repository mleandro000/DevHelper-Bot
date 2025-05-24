function configure_read_permissions(llm)
        local args = {
            {name = "file",description="the file name", type = "string", required = true},
        }
        local callback = function(args)
            print(private_vibescript.YELLOW.."Reading file: "..args.file..private_vibescript.RESET)
            return dtw.load_file(args.file)
        end
        llm.add_function("read", "read a file and return the content of the file",args,callback)
    
end 
function configure_write_permissions(llm)
        local args = {
            {name = "file",description="the file name", type = "string", required = true},
            {name = "content",description="the content to write", type = "string", required = true},
        }
        local callback = function(args)
            print(private_vibescript.YELLOW.."Writing file: "..args.file..private_vibescript.RESET)
            dtw.write_file(args.file, args.content)
            return "file written"
        end
        llm.add_function("write", "write a file and return the content of the file",args,callback)
end 



function configure_permissions(llm)
  

        local args = {
            {name = "command",description="the command to execute", type = "string", required = true},
        }
        local callback = function(args)
            print(private_vibescript.YELLOW.."Executing command: "..args.command..private_vibescript.RESET)
            os.execute(args.command .." > /.outcomand")
            local command_output =  dtw.load_file("/.outcomand")
            dtw.remove_any("/.outcomand")
            return command_output
        end
        llm.add_function("execute", "execute a command and return the output",args,callback)

        local args = {
            {name = "element",description="the element to remove", type = "string", required = true},
        }
        local callback = function(args)
            print(private_vibescript.YELLOW.."Deleting element: "..args.element..private_vibescript.RESET)
            dtw.remove_any(args.element)
            return "element removed"
        end
        llm.add_function("delete", "delete a file or a dir",args,callback)



        local args = {
            {name = "dir",description="the directory to list", type = "string", required = true},
        }
        local callback = function(args)
            print(private_vibescript.YELLOW.."Listing directory: "..args.dir..private_vibescript.RESET)
            local files ,size= dtw.list_files_recursively(args.dir)
            return files
        end
        llm.add_function("list", "list a directory and return the content of the directory",args,callback)

end 