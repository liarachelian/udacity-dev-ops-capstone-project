pipeline {
    agent any
        stages {
            stage('Build') {
                steps {
                    sh 'echo "This is the first step of the build"'
                    sh 'echo "Finish Build"'
                     }
            }
            stage('Lint Cloud Formation'){
                steps {
                    sh 'echo "Validating Cloud Formation yaml"'
                    retry(3){
                        sh 'cfn-lint ApplicationCloudFormationScripts/network.yaml'
                    }
                }
            }
        }
    post {
            always {
                echo 'Jenkins starting deployment'
            }
            success {
                echo 'The deployment has been successfully run'
            }
            failure {
                echo 'Deployment failed'
            }
            unstable {
                echo 'Something went wrong, unstable state'
            }
            changed {
                echo 'Pipeline has been changed'
            }
        }
}