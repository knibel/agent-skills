# agent-skills

This repository stores reusable local skills for Cursor and Copilot.

## Install

From a clone of this repository, run:

```bash
bash ./install.sh
```

That will:

- install `myskills` into `~/.local/bin`
- add `~/.local/bin` to your bash `PATH` in `~/.bashrc` when needed (creating that file only if your current shell is bash and it does not already exist)
- sync the repository skills into `~/.cursor/skills` and `~/.copilot/skills`

## Usage

```bash
myskills update
myskills push
```

- `myskills update` pulls the latest repository changes and installs the skills into both local skill directories
- `myskills push` copies local skill changes back into this repository, commits them with the generic message `Update skills`, and pushes them

Repository-managed skills are the ones installed from this repository as symlinks. An unmanaged skill is any local skill directory that is not one of those symlinks.

When both local skill directories contain the same unmanaged skill, `myskills push` imports `~/.cursor/skills` first and then `~/.copilot/skills`, so the Copilot copy takes precedence.

If you do not currently use bash, run the installer as usual and then add `~/.local/bin` to your shell startup file manually.