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
                    // Check if any container with the specified name exists and remove it
                    def containerIds = sh(script: 'docker ps -a -q --filter name=furniture-html-app', returnStdout: true).trim()
                    if (containerIds) {
                        sh "docker rm -f ${containerIds}"
                    } else {
                        echo "No containers found to clean up."
                    }
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
