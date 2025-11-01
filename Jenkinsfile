pipeline {
    agent any
    
    stages {
        stage('Install Apache') {
            steps {
                sh '''
                  sudo yum install httpd -y
                  sudo systemctl restart httpd
                 '''
                  
            }
        }
        stage ('Get Apache Version') {
            steps {
                sh 'httpd -V'
            }
        }
        stage ('Install maven') {
            steps {
                sh '''
                    sudo yum install maven -y
                    sudo mvn --version
                '''
            }
        }
    }
}
