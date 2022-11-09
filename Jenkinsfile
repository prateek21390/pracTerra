pipeline {
    agent any
    tools {
       terraform 'terraform'
    }
    stages {
      
        stage('Git checkout') {
           steps{
                git branch: 'main', credentialsId: 'github_credentials', url: 'https://github.com/prateek21390/Projectinfra.git'
            }
        }
        stage('chmod private key') {
            steps{
                sh 'chmod 400 Project.pem'
            }
        }
        stage('terraform format check') {
            steps{
                sh 'terraform fmt'
            }
        }
        stage('terraform Init') {
            steps{
                sh 'terraform init'
            }
        }
        stage('terraform apply') {
            steps{
                sh 'terraform apply --auto-approve'
            }
        }
    }

    
}

