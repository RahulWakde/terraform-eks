pipeline {
  agent any

  environment {
    AWS_REGION = "ap-south-1"
    TF_DIR     = "envs/dev"
  }

  options {
    timestamps()
    disableConcurrentBuilds()
  }

 stage('Checkout Code') {
  steps {
    git branch: 'main',
        credentialsId: 'github-creds',
        url: 'https://github.com/RahulWakde/terraform-eks.git'
  }
}


    stage('Terraform Init') {
      steps {
        withCredentials([
          [$class: 'AmazonWebServicesCredentialsBinding',
           credentialsId: 'aws-creds']
        ]) {
          dir("${TF_DIR}") {
            sh '''
              aws sts get-caller-identity
              terraform init -input=false
            '''
          }
        }
      }
    }

    stage('Terraform Validate') {
      steps {
        dir("${TF_DIR}") {
          sh 'terraform validate'
        }
      }
    }

    stage('Terraform Plan') {
      steps {
        withCredentials([
          [$class: 'AmazonWebServicesCredentialsBinding',
           credentialsId: 'aws-creds']
        ]) {
          dir("${TF_DIR}") {
            sh '''
              terraform plan \
                -out=tfplan \
                -input=false
            '''
          }
        }
      }
    }

    stage('Manual Approval') {
      steps {
        input message: 'Approve Terraform Apply for EKS + NGINX?'
      }
    }

    stage('Terraform Apply') {
      steps {
        withCredentials([
          [$class: 'AmazonWebServicesCredentialsBinding',
           credentialsId: 'aws-creds']
        ]) {
          dir("${TF_DIR}") {
            sh '''
              terraform apply \
                -auto-approve \
                tfplan
            '''
          }
        }
      }
    }
  }

  post {
    success {
      echo "✅ EKS Cluster and NGINX deployed successfully"
    }
    failure {
      echo "❌ Pipeline failed. Check Terraform logs."
    }
  }
}

