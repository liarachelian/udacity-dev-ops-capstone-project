pipeline {
    environment {
        dockerHubCredentials = 'DockerHub'
    }
    agent any
        stages {
            stage('Start Pipeline') {
                steps {
                    echo "This is the first step of the build"
                    echo "Start Build"
                    script {
                            env.GIT_HASH = sh(
                                script: "git show --oneline | head -1 | cut -d' ' -f1",
                                returnStdout: true
                                ).trim()
                            echo env.GIT_HASH
                          }
                     }
            }
            stage('Lint Dockerfile'){
                steps {
                    echo "Linting Docker File"
                    retry(2){
                        sh 'wget -O hadolint https://github.com/hadolint/hadolint/releases/download/v1.17.5/hadolint-Linux-x86_64 &&\
                                    chmod +x hadolint'
                        sh 'make lint'
                    }
                }
            }
            stage('Build & Push to Dockerfile') {
                 steps {
                    script {
                                echo "Build Docker Image"
                                dockerImage = docker.build("steeloctopus/duckhunt:latest")
                                echo "Push Docker Image"
                                retry(2){
                                docker.withRegistry('',dockerHubCredentials ) {
                                    dockerImage.push()
                                    }
                                }
                            }
                        }
                    }
                stage('Deploy blue container and create service') {
                    steps {
                		withAWS(region:'us-east-1', credentials:'AWSCredentials') {
                		    sh 'kubectl config view'
                            sh 'kubectl config use-context arn:aws:eks:us-east-1:124880580859:cluster/duckhunt'
                			sh 'kubectl apply -f ApplicationCloudFormationScripts/blue-deploy.yaml'
                			sleep(time:20,unit:"SECONDS")
                			sh 'kubectl apply -f ApplicationCloudFormationScripts/blue-service.json'
                				}
                			}
                		}
                stage('Approval to route traffic to backup') {
                    steps {
                       withAWS(region:'us-east-1', credentials:'AWSCredentials') {
                            sh 'kubectl get service/ducks'
                            }
                            input "Does the new version looks good?"
                        }
                }
                stage('Deploy latest on production cluster') {
                   steps {
                     withAWS(region:'us-east-1', credentials:'AWSCredentials') {
                         sh 'kubectl config use-context arn:aws:eks:us-east-1:124880580859:cluster/duckhunt'
                         sh 'kubectl apply -f ApplicationCloudFormationScripts/green-deploy.yaml'
                         sleep(time:20,unit:"SECONDS")
                         sh 'kubectl apply -f ApplicationCloudFormationScripts/green-service.json '
                         sh 'kubectl get service/ducks-prod'
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