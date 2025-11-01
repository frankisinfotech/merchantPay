pipeline {
    agent any
    
    stages {
        stage('Install Apache') {
            steps {
                sh '''
                  sudo yum install httpd -y
                  sudo systemctl restart httpd
                  sudo rm -rf /var/www/html/*
                  sudo wget https://github.com/codingstella/personal-blog-website/archive/refs/heads/main.zip -O website.zip 
                  sudo cp website.zip /var/www/html/ && unzip /var/www/html/website.zip
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
