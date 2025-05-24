function configure_system(llm)
llm.add_system_prompt("Speak in the user language") --- ordens 
llm.add_system_prompt("you objective is help to user on coding")
llm.add_system_prompt("never read files that you already have in memory") --- aqui eu posso definir o objetivo do chatbot
end