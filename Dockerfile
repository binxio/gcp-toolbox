FROM centos:8

ARG TERRAFORM_VERSION="0.12.17"

# Install google-cloud-sdk
RUN sh -c 'echo -e "[google-cloud-sdk] \n\
name=Google Cloud SDK \n\
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64 \n\
enabled=1 \n\
gpgcheck=1 \n\
repo_gpgcheck=1 \n\
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg \n\
    https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg" > /etc/yum.repos.d/google-cloud-sdk.repo' && \
    cat /etc/yum.repos.d/google-cloud-sdk.repo && \
    yum -y install google-cloud-sdk

# Install all gcloud components
RUN yum -y update && yum -y install \
    google-cloud-sdk-app-engine-python \
    google-cloud-sdk-app-engine-python-extras \
    google-cloud-sdk-app-engine-java \
    google-cloud-sdk-app-engine-go \
    google-cloud-sdk-bigtable-emulator \
    google-cloud-sdk-cbt \
    google-cloud-sdk-cloud-build-local \
    google-cloud-sdk-datalab \
    google-cloud-sdk-datastore-emulator \
    google-cloud-sdk-firestore-emulator \
    google-cloud-sdk-pubsub-emulator \
    kubectl

# Install kubemci
RUN yum -y update && yum -y install wget && \
    wget https://storage.googleapis.com/kubemci-release/release/latest/bin/linux/amd64/kubemci && \
    chmod 777 kubemci && \
    mv kubemci /usr/local/bin

# Install Terraform
RUN yum -y update && yum -y install wget unzip && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip ./terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin/ && \
    rm /terraform_${TERRAFORM_VERSION}_linux_amd64.zip

ENV GOOGLE_APPLICATION_CREDENTIALS '/credential.json'

ENTRYPOINT ["bash", "-c", "echo $GCP_SERVICE_KEY > /credential.json && bash"]
