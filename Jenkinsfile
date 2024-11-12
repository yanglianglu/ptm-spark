pipeline {
    agent {
        docker {
            image 'docker:20.10.7' // Use the official Docker image
            args '-v /var/run/docker.sock:/var/run/docker.sock' // Bind Docker socket for Docker CLI access
        }
    }
    environment {
        // Define image name and tag for Docker
        IMAGE_NAME = "spark"
        IMAGE_TAG = "dev"
        DOCKER_REGISTRY = "http://localhost:52322/"  // Replace with your registry, if different
    }
    }
    stages {
        stage('Build') {
            steps {
                script {
                    // Build the Docker image using Docker Plugin syntax
                    docker.build("${REGISTRY}/${IMAGE_NAME}:${TAG}", "-f Dockerfile .")
                }
            }
        }
        stage('Push to Registry') {
            steps {
                script {
                    // Login to Docker registry (if required)
                    docker.withRegistry("https://${env.REGISTRY}", 'registry-credentials-id') {
                        // Push the Docker image
                        docker.image("${REGISTRY}/${IMAGE_NAME}:${TAG}").push()
                    }
                }
            }
        }
    }
}
