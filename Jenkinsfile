pipeline {
    agent any
    
    stages {
        stage('Install Apache') {
            steps {
                sh '''
                  sudo yum install httpd -y
                  sudo systemctl restart httpd
                  sudo cd /var/www/html && wget https://github.com/codingstella/personal-blog-website/archive/refs/heads/main.zip -O site.zip \
                  && sudo unzip site.zip -d /var/www/html && cp personal-blog-website-main/* /var/www/html  rm site.zip
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
