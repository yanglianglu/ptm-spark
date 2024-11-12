pipeline {
    agent any

    environment {
        // Define image name and tag for Docker
        IMAGE_NAME = "spark"
        IMAGE_TAG = "dev"
        DOCKER_REGISTRY = "http://localhost:52322/"  // Replace with your registry, if different
    }

    stages {

        stage('Docker Build') {
            steps {
                script {
                    // Use Docker build and tag the image for the Minikube registry
                    sh """
                        docker build -t ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG} .
                    """
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    // Push the Docker image to the Minikube registry
                    sh "docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }

    }

    post {
        always {
            sh 'echo "Pipeline finished."'
        }
    }
}
