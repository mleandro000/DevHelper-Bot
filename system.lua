function configure_system(llm)
llm.add_system_prompt("Speak in the user language") --- ordens 
llm.add_system_prompt("you objective is help to user on coding") --- aqui eu posso definir o objetivo do chatbot
end