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
               sh 'docker build -t gaurankgoyal25/i-gaurankgoyal-${env.BRANCH_NAME} .'
               sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
               sh 'docker push gaurankgoyal25/i-gaurankgoyal-${env.BRANCH_NAME}:latest'
            }
        }
        stage('Sonarqube Analysis') {
            when {
                branch "develop"
            }
            steps {
               withSonarQubeEnv(installationName: 'Test_Sonar') {
                         sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=sonar-gaurankgoyal -Dsonar.projectName=sonar-gaurankgoyal'
                       }
            }
        }

        stage('Test Case Execution') {
            when {
                branch "master"
            }
            steps {
               sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
               echo 'Deployed'
            }
        }
    }
}