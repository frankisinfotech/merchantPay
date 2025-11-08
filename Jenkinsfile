pipeline {
    agent any
    
    stages {
        stage('BuildImageToDockerHub') {
            steps {
              withDockerRegistry([credentialsId: "DOCKERHUB", url: ""]) {
                sh '''
                  docker build -t ecom .
                  docker tag ecom frankisinfotech/ecom:v1
                  docker push frankisinfotech/ecom:v1
                 '''
            }
        }
        }

}
}
