FROM ubuntu:20.04 as dev-env
WORKDIR /work 
RUN apt-get update -y
# RUN  apt-get install -y curl 
# RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
# RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
# RUN apt-get update &&  apt-get install terraform
# RUN apt-get update -y
RUN apt-get install git -y
# RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
# RUN chmod +x ./kubectl
# RUN mv ./kubectl /usr/local/bin/kubectl
# RUN apt-get update -y
# RUN apt-get install software-properties-common
# RUN add-apt-repository --yes --update ppa:ansible/ansible
# RUN apt-get install ansible -y
# RUN ansible --help

# RUN apt-get install \
#     ca-certificates \
#     lsb-release
# RUN mkdir -p /etc/apt/keyrings
# RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# RUN echo \
#   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) stable" |  tee /etc/apt/sources.list.d/docker.list > /dev/null
# RUN apt-get update -y
# RUN apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
# RUN service docker start

