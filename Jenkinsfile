pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    try {
                        sh 'docker build -t my-nginx-website:latest .'
                    } catch (e) {
                        echo "Failed to build Docker image: ${e}"
                        currentBuild.result = 'FAILURE'
                    }
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    try {
                        // Stop and remove the existing container if it exists
                        sh '''
                            docker stop my-nginx-container || true
                            docker rm my-nginx-container || true
                        '''
                        // Start a new container with volume mounting
                        sh '''
                            docker run -d \
                                --name my-nginx-container \
                                -p 8081:80 \
                                -v /var/logs/nginx-sample-website:/var/log/nginx \
                                -v ~/nginx-sample-website:/usr/share/nginx/html:rw \
                                my-nginx-website:latest
                        '''
                        // Check if the container is running
                        sh 'docker ps -a | grep my-nginx-container'
                    } catch (e) {
                        echo "Failed to start Docker container: ${e}"
                        currentBuild.result = 'FAILURE'
                    }
                }
            }
        }
    }
    post {
        failure {
            echo 'Pipeline failed!'
        }
        success {
            echo 'Pipeline succeeded!'
        }
    }
}
