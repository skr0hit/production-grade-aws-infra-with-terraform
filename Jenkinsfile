// Jenkinsfile for Terraform IaC Scanning

pipeline {
    agent any // Run on the Jenkins master node

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
        
        stage('Scan Terraform Code with tfsec') {
            steps {
                script {
                    try {
                        // Run tfsec on the entire repository.
                        // The '.' means "scan the current directory".
                        sh 'tfsec .'
                    } catch (Exception e) {
                        // The 'sh' step will fail if tfsec finds any issues.
                        // We catch the error to allow the pipeline to report a FAILURE status.
                        echo "tfsec scan failed. See logs for details."
                        currentBuild.result = 'FAILURE'
                    }
                }
            }
        }
    }
}