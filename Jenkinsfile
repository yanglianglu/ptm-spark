pipeline {
    agent any

    environment {
        IMAGE_NAME = "spark"
        IMAGE_TAG = "dev"
        REGISTRY = "localhost:52322"  // Replace with your Docker registry
    }
    stages {
        stage('Build') {
            steps {
                script {
                    
                    // Build the Docker image
                    def image = docker.build("${REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}", "-f Dockerfile .")
                }
            }
        }
        stage('Push to Registry') {
            steps {
                script {
                    // Push the Docker image to registry
                    docker.withRegistry("http://${REGISTRY}", 'registry-credentials-id') {
                        docker.image("${REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}").push()
                    }
                }
            }
        }
    }
}
