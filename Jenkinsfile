pipeline {
    agent any
    environment {
        AWS_CREDENTIALS = credentials('aws-creds-id')
        TF_DIR          = 'envs/dev'
    }
    stages {
        stage('Checkout') {
            steps { checkout scm }
        }
        stage('Terraform Init') {
            steps {
                dir("${TF_DIR}") { sh 'terraform init -upgrade' }
            }
        }
        stage('Terraform Plan') {
            steps {
                dir("${TF_DIR}") { sh 'terraform plan -out=tfplan' }
            }
        }
        stage('Terraform Apply') {
            steps {
                dir("${TF_DIR}") { sh 'terraform apply -auto-approve tfplan' }
            }
        }
    }
}
