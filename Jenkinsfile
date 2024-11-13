pipeline {
    agent any

    environment {
        IMAGE_NAME = "spark"
        IMAGE_TAG = "dev"
        REGISTRY = "localhost:52322"  // Replace with your Docker registry
    }
    stages {
        stage('Deploy') {
            steps {
                // Deploy the build artifacts or Docker images to a registry/server
                sh 'echo "Deploying application..."'
                // Example for a Docker deployment: sh 'docker push your-image:tag'
            }
        }   
    }
}
