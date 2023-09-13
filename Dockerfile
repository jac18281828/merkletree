FROM ghcr.io/xmtp/foundry:latest

ARG PROJECT=merkletree
WORKDIR /workspaces/${PROJECT}
RUN chown -R xmtp:xmtp .
COPY --chown=xmtp:xmtp . .
ENV USER=xmtp
USER xmtp
ENV PATH=${PATH}:~/.cargo/bin
RUN yarn install --frozen-lockfile
RUN yarn prettier:check
RUN yarn hint
RUN forge test -vvv
