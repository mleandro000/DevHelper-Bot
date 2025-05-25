# DevBot 🤖

DevBot is a versatile tool designed to assist developers in their daily tasks. It leverages AI to provide intelligent responses and automate various operations.

## Features 🚀

- **Chat Mode**: Engage in a conversational interface where you can ask questions or provide prompts, and DevBot will respond accordingly.
- **Prompt Mode**: Use the `--prompt` or `-p` flag to provide a prompt directly from the command line.
- **Prompt File Mode**: Use the `--prompt_file` or `-pf` flag to provide a file containing the prompt.
- **Output to File**: Use the `--output` or `-o` flag to save the AI's response to a file instead of displaying it in the terminal.
- **Reset**: Use the `reset` command during chat mode to reset the AI's context.
- **Exit**: Use the `exit` command to end the chat session.
- **Entry Management**: Manage entries (files or directories) to be used as context for the AI.

## Installation 🔧

### Prerequisites

- [VibeScript](https://github.com/OUIsolutions/VibeScript) installed on your system

### Step 1: Install VibeScript

Visit the [VibeScript repository](https://github.com/OUIsolutions/VibeScript) and download the appropriate version for your operating system from the [releases page](https://github.com/OUIsolutions/VibeScript/releases/tag/0.2.0).

### Step 2: Configure an AI Model

Configure a VibeScript model. If you don't have one set up:

```bash
vibescript configure_model --model grok-2-latest --url https://api.x.ai/v1/chat/completions --key "your_api_key"
```

### Step 3: Clone the Repository

```bash
git clone https://github.com/mleandro000/DevHelper-Bot
```

### Step 4: Add DevBot to VibeScript Path

```bash
vibescript add_script --file DevHelper-Bot/src/main.lua devbot2
```


## Usage 💻

### Chat Mode

To start DevBot in chat mode, simply run the script without any arguments. You will be prompted to enter your queries or commands.

```bash
vibescript devbot
```

### Chat Commands 📖

- **reset**: Resets the AI's context during chat mode.
- **exit**: Ends the chat session.


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

### Entry Management Commands

DevBot allows you to manage entries (files or directories) that can be used as context for the AI:

- **Subscribe Entry**: Add a file or directory as an entry with a specific name for later reference.
  ```bash
  vibescript devbot subscribe_entrie my_entry_name --path /path/to/file_or_directory
  ```

- **List Entries**: Display all registered entries with their names and paths.
  ```bash
  vibescript devbot list_entries
  ```

- **Remove Entry**: Delete a specific entry by its name.
  ```bash
  vibescript devbot remove_entrie entry_name
  ```

- **Use Entries in Chat/Prompt**: Reference entries in your chat or prompt commands to include their content as context for the AI (can specify multiple entries with repeated flags).
  ```bash
  vibescript devbot --entries entry_name1 --entries entry_name2
  vibescript devbot --prompt "Your prompt here" --entries entry_name1
  ```



## License 📜

This project is licensed under the MIT License - see the LICENSE file for details.

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

-----------------
