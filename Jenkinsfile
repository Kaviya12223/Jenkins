
pipeline {
    agent any

    environment {
        IMAGE_NAME = 'my-html-application'
        CONTAINER_NAME = 'my-html-container'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Kaviya12223/Jenkins.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $IMAGE_NAME ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove existing container if it exists
                    sh "docker rm -f $CONTAINER_NAME || true"
                    
                    // Run new container
                    sh "docker run -d --name $CONTAINER_NAME -p 8090:80 $IMAGE_NAME"
                }
            }
        }
    }

    post {
        failure {
            echo '🚫 Deployment failed!'
        }
        success {
            echo '✅ Deployment successful! Visit http://localhost:8090'
        }
    }
}
