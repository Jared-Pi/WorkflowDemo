# Use the official Jenkins inbound agent image as the base
FROM jenkins/inbound-agent:latest

# Set environment variables
ENV MAVEN_VERSION=3.9.9
ENV MAVEN_HOME=/usr/share/maven
ENV PATH=$MAVEN_HOME/bin:$PATH

# Install dependencies
USER root

# Install Git, Maven, and Docker CLI
RUN apt-get update && \
    apt-get install -y \
        git \
        curl \
        docker.io && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Maven
RUN mkdir -p /usr/share/maven /usr/share/maven/ref && \
    curl -fsSL https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz | \
    tar -xzC /usr/share/maven --strip-components=1 && \
    ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

# Add Jenkins user to the Docker group (for Docker-in-Docker)
RUN usermod -aG docker jenkins

# Switch back to the Jenkins user
USER jenkins

# Verify installations
RUN git --version && \
    mvn --version && \
    docker --version