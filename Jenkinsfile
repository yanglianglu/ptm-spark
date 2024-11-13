pipeline {
    agent {
        docker {
            image 'docker:20.10.7' // Use the Docker image with Docker CLI installed
            args '--privileged -v /var/run/docker.sock:/var/run/docker.sock --network host' // Access to host Docker daemon
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
                sh 'docker version' // Verify Docker is available
                sh 'docker build -t ${REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG} -f Dockerfile .'
            }
        }
        stage('Push to Registry') {
            steps {
                sh 'docker push ${REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}'
            }
        }
    }
}
