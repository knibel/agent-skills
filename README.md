# agent-skills

This repository stores reusable local skills for Cursor and Copilot.

## Install

Run the installer from this repository:

```bash
bash /tmp/workspace/knibel/agent-skills/install.sh
```

That will:

- install `myskills` into `~/.local/bin`
- add `~/.local/bin` to your `PATH` in `~/.bashrc` when needed
- sync the repository skills into `~/.cursor/skills` and `~/.copilot/skills`

## Usage

```bash
myskills update
myskills push
```

- `myskills update` pulls the latest repository changes and installs the skills into both local skill directories
- `myskills push` copies local skill changes back into this repository, commits them with the generic message `Update skills`, and pushes them

When both local skill directories contain the same unmanaged skill, the copy from `~/.copilot/skills` wins during `myskills push`.