pipeline {
    agent { docker { image 'python:3.5.1' } }
        stages {
            stage('Build') {
                steps {
                    sh 'echo "This is the first step of the build"'
                    sh 'echo "Finish Build"'
                    sh 'pwd'
                     }
            }
            stage('Lint Cloud Formation'){
                steps {
                    sh 'echo "Validating Cloud Formation yaml"'
                    retry(2){
                        sh 'make setup'
                        sh 'make install'
                        sh 'cfn-lint ApplicationCloudFormationScripts/network.yaml'
                    }
                }
            }
//             stage('Publish to S3') {
//                 steps {
//                 withAWS(region: 'us-east-1', credentials: 'Jenkins') {
//                           sh 'echo "Uploading content with AWS creds"'
//                           s3Upload(pathStyleAccessEnabled: true, payloadSigningEnabled: true, file: 'index.html', bucket: 'udacity-dev-ops-project-three')
//                           s3Upload(pathStyleAccessEnabled: true, payloadSigningEnabled: true, file: 'IMG_0809.jpg',
//                            bucket: 'udacity-dev-ops-project-three')
//                         }
//                 }
//             }
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