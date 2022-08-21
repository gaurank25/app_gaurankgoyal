pipeline {
    agent any
    environment {
    		USERNAME="gaurankgoyal"
    	}
    tools {
        maven 'Maven3'
    }
    stages {
        stage('Build') {
            steps {
               sh 'mvn clean install -DskipTests'
//                sh "docker build -t ${USERNAME}25/i-${USERNAME}-${env.BRANCH_NAME} ."
//                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
//                sh "docker push ${USERNAME}25/i-${USERNAME}-${env.BRANCH_NAME}:latest"
            }
        }
        stage('Sonarqube Analysis') {
            when {
                branch "develop"
            }
            steps {
               withSonarQubeEnv(installationName: 'Test_Sonar') {
                         sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=sonar-${USERNAME} -Dsonar.projectName=sonar-${USERNAME}'
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
               sh 'cat Kubernetes/configmap.yaml| sed "s/{{BRANCH_NAME}}/$BRANCH_NAME/g" | kubectl apply -f -'
               sh 'cat Kubernetes/deployment.yaml | sed "s/{{BRANCH_NAME}}/$BRANCH_NAME/g" | kubectl apply -f -'
               sh 'cat Kubernetes/service.yaml | sed "s/{{BRANCH_NAME}}/$BRANCH_NAME/g" | kubectl apply -f -'
               sh 'cat Kubernetes/secrets.yaml | sed "s/{{BRANCH_NAME}}/$BRANCH_NAME/g" | kubectl apply -f -'
            }
        }
    }
}