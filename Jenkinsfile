pipeline {
    agent any

    
    environment {
        DOCKER_REPOSITORY_TAG     = "${DOCKER_REPO_TAG}/${APP_NAME}:${TAG}"
        DOCKER_REPO_TAG           = "frankisinfotech"
        APP_NAME                  = "docker-ecom"
        TAG                       = "${BUILD_ID}"
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

}
}
