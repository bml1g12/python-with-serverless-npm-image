FROM python:3.7.6
# ran from root of repo with thrischedulergenesis as a subfolder

RUN curl -fsSL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get update && \
    apt-get install -y --no-install-recommends nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN npm install -g serverless
