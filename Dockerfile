# Base image with JDK
FROM eclipse-temurin:23-jdk

# Set working directory
WORKDIR /app

# Install dependencies (Ant and Python)
RUN apt-get update && \
    apt-get install -y ant python3 python3-pip && \
    apt-get clean

# Set environment variables
ENV ANT_HOME=/usr/share/ant \
    PYTHON_HOME=/usr/bin/python3 \
    PATH=$PATH:$JAVA_HOME/bin:$ANT_HOME/bin:$PYTHON_HOME

# Copy project files into the container
COPY . /app

# Build using ant
RUN ant jar

# Default command (you can override this)
CMD ["java", "-jar", "build/jar/aarithmetic.jar", "float","div","244727.15202","75964.3891"]
#CMD ["java", "-jar", "build/jar/aarithmetic.jar"]
