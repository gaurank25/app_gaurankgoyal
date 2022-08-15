pipeline {
    agent any
    tools {
        maven 'maven3'
    }
    stages {
        stage('Build') {
            steps {
               sh 'mvn clean install'
               sh 'docker build -t gaurankgoyal25/i-gaurankgoyal-main .'
            }
        }
        stage('Sonarqube Analysis') {
            steps {
               echo 'sonar analysis'
            }
        }
    }
}