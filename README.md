# Claude Skills Starter

This repository contains a starter project for building agents using Claude CLI and [Claude Skills](https://docs.claude.com/en/docs/claude-code/skills). It contains the [example skills](https://github.com/anthropics/skills) from Anthropic which are copied to the [`.claude/skills`](.claude/skills) directory. Modify this directly to add your own skills or change existing ones.

## Run the agent locally

1. Install the latest Node.js LTS release (from [nodejs.org](https://nodejs.org/)).
2. Install the Claude CLI globally:
   ```bash
   npm install -g @anthropic-ai/claude-code
   ```
3. Run Claude directly from your shell:
   ```bash
   claude
   ```
   Type an example like: `create a frogger game using the artifact builder skill`

## Run the agent non-interactively

You can also pass the prompt directly and run claude CLI in non-interactive mode:
```bash
claude -p "create a frogger game using the artifact builder skill" --permission-mode bypassPermissions
```
Note that using `--permission-mode bypassPermissions` is required to allow the agent to run without manual approval. As this is a security risk, better run the agent in Docker as described below.

## Run with Docker

Running the agent in Docker allows to run the agent in a secure sandbox

1. Build the wrapper image:
   ```bash
   docker build -t agent .
   ```
   The Dockerfile uses the latest Node.js LTS base image, installs `@anthropic-ai/claude-code`, and copies the repository's `.claude` directory into `/root/.claude` inside the container.

2. Invoke Claude through Docker, mounting the current project so the CLI can inspect and modify files:
   ```bash
   docker run --rm -it \
     -v "$(pwd)":/workspace \
     agent 
   ```

Because the container's entrypoint is `claude`, the container will behave like the original Claude CLI. E.g. you can also pass non-interactive prompts using the `-p` flag. 

## More information about Claude Skills

- [What are skills?](https://support.claude.com/en/articles/12512176-what-are-skills)
- [How to create custom skills](https://support.claude.com/en/articles/12512198-creating-custom-skills)

## License

The Claude skills are licensed under the Apache 2.0 License. The starter project itself is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.
