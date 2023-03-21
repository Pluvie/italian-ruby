FROM ruby:3.0

# Installazione gemme e dipendenze.
RUN apt-get update &&   \
    apt-get install -y  \
      build-essential

WORKDIR /italian-ruby
COPY . .
RUN bundle install

# Configurazione Bash e SSH.
RUN mkdir -p /root/.ssh && \
    mkdir -p /root/.ssh-keys
RUN ln -s /root/.ssh-keys/fb      /root/.ssh && \
    ln -s /root/.ssh-keys/fb.pub  /root/.ssh
RUN echo "\n\n"\
  "# Custom prompt\n"\
  "PS1=\"\[\e[1;34m\]\w\[\e[m\] # \"\n\n"\
  "# Alias lista\n"\
  "alias ll='ls -alF'\n\n"\
  "# Avvio ssh-agent\n"\
  "if [ -z \"\$SSH_AUTH_SOCK\" ]\n"\
  "then\n"\
  "  # Check for a currently running instance of the agent\n"\
  "  RUNNING_AGENT=\"\`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'\`\"\n"\
  "  if [ \"\$RUNNING_AGENT\" = "0" ]\n"\
  "  then\n"\
  "    # Launch a new instance of the agent\n"\
  "    ssh-agent -s &> \$HOME/.ssh-agent\n"\
  "  fi\n"\
  "  eval \`cat \$HOME/.ssh-agent\`\n"\
  "  ssh-add ~/.ssh/fb\n"\
  "fi\n"\
  >> ~/.bashrc

# Evita errori di ownership git.
RUN git config --global --add safe.directory /italian-ruby

CMD [ "/bin/bash" ]
