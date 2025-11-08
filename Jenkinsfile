pipeline {
    agent any

    
    environment {
        DOCKER_REPOSITORY_TAG     = "${DOCKER_REPO_TAG}/${APP_NAME}:${TAG}"
        DOCKER_REPO_TAG           = "frankisinfotech"
        APP_NAME                  = "docker-ecom"
        TAG                       = "${BUILD_ID}"

        AWS_PRIVATE_REPO          = "765176032689.dkr.ecr.eu-west-1.amazonaws.com"
        AWS_APP_NAME              = "merchantpay"
  }

    
    stages {
        stage('BuildImage') {
            steps {
              withDockerRegistry([credentialsId: "DOCKERHUB", url: ""]) {
                sh '''
                  docker build -t ${APP_NAME} .
                  docker tag ${APP_NAME} ${DOCKER_REPO_TAG}/${APP_NAME}:${TAG}
                  docker push ${DOCKER_REPO_TAG}/${APP_NAME}:${TAG}
                 '''
            }
        }
        }

        stage ('BuildToECR') {
          steps {
             withEnv(["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}", "AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}", "AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]) {
                sh 'docker login -u AWS -p $(aws ecr get-login-password --region eu-west-1) ${AWS_PRIVATE_REPO}'
                sh 'docker build -t ${AWS_APP_NAME}:${TAG} .'
                sh 'docker tag ${AWS_APP_NAME}:${TAG} ${AWS_PRIVATE_REPO}/${AWS_APP_NAME}:${TAG}'
                sh 'docker push ${AWS_PRIVATE_REPO}/${AWS_APP_NAME}:${TAG}'
         }
       }
    }

}                             
}
