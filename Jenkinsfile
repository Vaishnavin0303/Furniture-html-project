pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'furniture-html-app'
        DOCKER_REGISTRY = 'docker.io'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Run the container
                    sh 'docker run -d -p 80:80 $DOCKER_IMAGE'
                }
            }
        }
        stage('Clean Up') {
            steps {
                script {
                    // Remove the previous container (if exists)
                    sh 'docker ps -a -q --filter "name=$DOCKER_IMAGE" | xargs docker rm -f'
                }
            }
        }
    }

    post {
        always {
            cleanWs()  // Clean the workspace after the pipeline run
        }
    }
}
