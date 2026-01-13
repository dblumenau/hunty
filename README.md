# 🔍 hunty

**Search your Claude Code conversations with personality.**

She hunts. She finds. She *slays*.

## Installation

```bash
curl -fsSL https://raw.githubusercontent.com/dblumenau/hunty/main/install.sh | bash
```

Or manually:
```bash
curl -o ~/.local/bin/hunty https://raw.githubusercontent.com/dblumenau/hunty/main/hunty
chmod +x ~/.local/bin/hunty
```

## Dependencies

```bash
brew install gum fd ripgrep jq fzf
```

## Usage

```bash
# Interactive mode - the full experience
hunty

# Search for a pattern in today's conversations
hunty "api endpoint"

# Search last 7 days
hunty -d 7 "typescript"

# Search all time
hunty -a "that thing I said"

# Filter by project
hunty -p dotfiles "slay"
```

## Features

- 🔍 **Full-text search** across all Claude Code conversations
- 📅 **Time filtering** - search today, last 7 days, or all time
- 🎯 **Project filtering** - narrow down by project path
- 👀 **Live preview** - fzf preview pane shows conversation context
- ▶️ **Resume sessions** - jump right back into any conversation
- 📝 **View in pager** - read full conversations in bat/less
- 💅 **60+ sassy loading messages** that rotate every 5 seconds

## Actions

After selecting a search result:

| Action | Description |
|--------|-------------|
| View in pager | Read the full conversation in bat/less |
| Resume session | Launch Claude Code and continue the conversation |
| Open in VSCode | Open the raw JSONL transcript |
| Copy session ID | Copy the session UUID to clipboard |

## How It Works

Claude Code stores conversations in `~/.claude/projects/` as JSONL files. hunty uses:
- `fd` to find transcript files (filtered by modification time)
- `rg` (ripgrep) to search content
- `fzf` with preview for interactive selection
- `jq` to parse the JSONL format

## Related

- [slay](https://github.com/dblumenau/slay) - Deployment monitoring CLI with personality

---

*"Where did I say that? Oh honey, let me find the receipts."*
