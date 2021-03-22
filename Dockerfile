FROM python:3.7.6
# ran from root of repo with thrischedulergenesis as a subfolder

RUN curl -fsSL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    nodejs \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \ 
    apt-get install -y docker-ce docker-ce-cli containerd.io && \ 
    pip3 install --no-cache-dir docker-compose && \
    apt -qy autoremove && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    npm install -g serverless

