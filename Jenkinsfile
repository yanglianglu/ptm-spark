pipeline {
    agent {
        docker {
            image 'docker:20.10.7' // Use Docker image with Docker CLI
            args '--privileged -v /var/run/docker.sock:/var/run/docker.sock --network host' // Bind Docker socket and use host network
        }
    }
    environment {
        IMAGE_NAME = "spark"
        IMAGE_TAG = "dev"
        REGISTRY = "localhost:52322"  // Replace with your Docker registry
    }
    stages {
        stage('Build') {
            steps {
                // Specify to run explicitly in the docker container
                container('docker') { 
                    sh 'docker version' // Verify Docker is available
                    sh 'docker build -t ${REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG} -f Dockerfile .' // Build Docker image
                }
            }
        }
        stage('Push to Registry') {
            steps {
                // Specify to run explicitly in the docker container
                container('docker') { 
                    sh 'docker push ${REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}' // Push Docker image to registry
                }
            }
        }
    }
}
