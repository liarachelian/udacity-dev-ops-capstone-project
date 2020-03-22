pipeline {
    environment {
        dockerHubCredentials = 'Docker Hub'
    }
    agent any
        stages {
            stage('Build') {
                steps {
                    sh 'echo "This is the first step of the build"'
                    sh 'echo "Start Build"'
                     }
            }
            stage('Linting Docker Files'){
                steps {
                    sh 'echo "Linting Docker File"'
                    retry(2){
                        sh 'wget -O hadolint https://github.com/hadolint/hadolint/releases/download/v1.17.5/hadolint-Linux-x86_64 &&\
                                    chmod +x hadolint'
                        sh 'make lint'
                    }
                }
            }
            stage('Build & Push to dockerhub') {
                        steps {
                            script {
                                dockerImage = docker.build("steeloctopus/duckhunt:1.0")
                                docker.withRegistry('',dockerHubCredentials ) {
                                    dockerImage.push()
                                }
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