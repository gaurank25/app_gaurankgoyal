pipeline {
    agent any
    environment {
//    		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
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
        stage('Kubernetes Deployment') {
            steps {
               sh 'cat Kubernetes/configmap.yaml| sed "s/{{BRANCH_NAME}}/$BRANCH_NAME/g" | kubectl apply -f -'
               sh 'cat Kubernetes/deployment.yaml | sed "s/{{BRANCH_NAME}}/$BRANCH_NAME/g" | kubectl apply -f -'
               sh 'cat Kubernetes/service.yaml | sed "s/{{BRANCH_NAME}}/$BRANCH_NAME/g" | kubectl apply -f -'
               sh 'cat Kubernetes/secrets.yaml | sed "s/{{BRANCH_NAME}}/$BRANCH_NAME/g" | kubectl apply -f -'
               echo 'check if service is deployed and is ready to serve traffic'
               sh 'while [ `kubectl get svc lb-service-$BRANCH_NAME -n kubernetes-cluster-gaurankgoyal -o jsonpath=\'{.status.loadBalancer}\'` = \'{}\' ]; do echo Service is Not Ready ..; sleep 2; done'
               echo 'ALB Endpoint Endpoint'
               sh 'echo "http://`kubectl get svc lb-service-$BRANCH_NAME -n kubernetes-cluster-gaurankgoyal -o jsonpath=\'{..ip}\'`"/app_gaurankgoyal'
            }
        }
    }
}