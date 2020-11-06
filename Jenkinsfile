  pipeline {
    agent {
      node {
        label "master"
      } 
    }

    stages {
      stage('fetch_latest_code') {
        steps {
          git credentialsId: 'esteban0477', url: 'https://github.com/esteban0477/iac_aws'
        }
      }

      stage('TF Init&Plan') {
        steps {
          withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'awsjuan', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
            sh 'terraform init'
            sh 'terraform plan'
          }
        }      
      }

      stage('Approval') {
        steps {
          script {
            def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
          }
        }
      }

      stage('TF Apply') {
        steps {
          withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'awsjuan', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
            sh 'terraform apply -input=false -auto-approve'
          }
        }
      }
    } 
  }