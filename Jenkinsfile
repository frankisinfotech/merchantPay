pipeline {
    agent any
    
    stages {
        stage('BuildImageToDockerHub') {
            steps {
              withDockerRegistry([credentialsId: "DOCKERHUB", url: ""]) {
                sh '''
                  docker build -t ecom .
                  docker tag ecom frankisinfotech/ecom:${BUILD_ID}
                  docker push frankisinfotech/ecom:${BUILD_ID}
                 '''
            }
        }
        } 

}
}
