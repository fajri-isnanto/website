pipeline {
    agent any

    stages {
        stage('Build and Push Docker Image') {
            steps {
                script {
                    // Build and push the Docker image to Docker Hub
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        def customImage = docker.build('my-custom-nginx:latest', '-f Dockerfile.custom .')
                        customImage.push()
                    }
                }
            }
        }

        stage('Deploy Docker Image') {
            steps {
                script {
                    // SSH into the server and run the Docker image
                    sshagent(['your-ssh-key']) {
                        sh "ssh -o StrictHostKeyChecking=no user@172.20.103.221 'docker run -d -p 80:80 my-custom-nginx:latest'"
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded! Docker image built and deployed.'
        }
        failure {
            echo 'Pipeline failed! Handle errors if needed.'
        }
    }
}
