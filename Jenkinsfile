pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                // Build your Docker image
                script {
                    sh 'chmod +x build.sh' 
                    sh './build.sh'
                    
                }
            }
        }
        
        stage('Push') {
            steps {
                // Push the Docker image to a Docker registry
                script {
                    sh 'chmod +x deploy.sh'
                    sh './deploy.sh'
                    }
                }
            }
        }
    }
}
