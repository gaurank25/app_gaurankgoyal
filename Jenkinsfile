pipeline {
    agent {
        docker { image 'node:16.13.1-alpine' }
    }
    stages {
        stage('Git Check Out') {
            steps {
                echo 'hello'
            }
        }
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
    }
}