FROM node:lts

# Install the Claude CLI globally.
RUN npm install -g @anthropic-ai/claude-code

# Provide a workspace that can be mounted from the host.
WORKDIR /workspace

# Include the project's Claude configuration inside the image.
COPY .claude /root/.claude

# Allow users to run `docker run agent -p ...` directly.
ENTRYPOINT ["claude"]
