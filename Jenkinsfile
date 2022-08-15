pipeline {
    agent any
    environment {
    		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
    	}
    tools {
        maven 'maven3'
    }
    stages {
        stage('Build') {
            steps {
               sh 'mvn clean install'
               sh 'docker build -t gaurankgoyal25/i-gaurankgoyal-main .'
               sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
               sh 'docker push gaurankgoyal25/i-gaurankgoyal-main:latest'
            }
        }
        stage('Sonarqube Analysis') {
            steps {
               withSonarQubeEnv(installationName: 'Test_Sonar') {
                         sh './mvnw clean org.sonarsource.scanner.maven:sonar-maven-plugin:3.9.0.2155:sonar'
                       }
            }
        }
    }
}