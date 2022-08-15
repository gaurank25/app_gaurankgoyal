pipeline {
    agent any
    tools {
        maven 'maven3'
    }
    stages {
        stage('Build') {
            steps {
               sh 'mvn clean install'
            }
            steps {
                sh 'docker ps'
            }
        }
    }
    stages {
            stage('Sonarqube Analysis') {
                steps {
                   echo 'sonar analysis'
                }
            }
        }
}