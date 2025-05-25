# DevBot

DevBot is a versatile tool designed to assist developers in their daily tasks. It leverages AI to provide intelligent responses and automate various operations.

## Features

- **Chat Mode**: Engage in a conversational interface where you can ask questions or provide prompts, and DevBot will respond accordingly.
- **Prompt Mode**: Use the `--prompt` or `-p` flag to provide a prompt directly from the command line.
- **Prompt File Mode**: Use the `--prompt_file` or `-pf` flag to provide a file containing the prompt.
- **Output to File**: Use the `--output` or `-o` flag to save the AI's response to a file instead of displaying it in the terminal.
- **Reset**: Use the `reset` command during chat mode to reset the AI's context.
- **Exit**: Use the `exit` command to end the chat session.

## Usage

### Chat Mode

To start DevBot in chat mode, simply run the script without any arguments. You will be prompted to enter your queries or commands.

```bash
vibescript devbot
```

### Prompt Mode

To use DevBot with a prompt directly from the command line:

```bash
vibescript devbot --prompt "Your prompt here"
```

### Prompt File Mode

To use DevBot with a prompt from a file:

```bash
vibescript devbot --prompt_file path/to/your/prompt_file.txt
```

### Output to File

To save the AI's response to a file:

```bash
vibescript devbot --prompt "Your prompt here" --output path/to/output_file.txt
```

## Commands

- **reset**: Resets the AI's context during chat mode.
- **exit**: Ends the chat session.

## Color Coding

DevBot uses color coding to distinguish between user input and AI responses:
- **User Input**: Green
- **AI Response**: Blue

## License

This project is released into the public domain under the Unlicense - see the LICENSE file for details.

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!
