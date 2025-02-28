pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t my-nginx-website:latest .'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
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
                            -v /path/to/local/data:/usr/share/nginx/html:ro \
                            my-nginx-website:latest
                    '''
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
