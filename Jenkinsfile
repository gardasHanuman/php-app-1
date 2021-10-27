pipeline{
    agent none
    environment{
        IMAGE_NAME='devopstrainer/java-mvn-privaterepo:php$BUILD_NUMBER'
    }
    stages{
        stage("Build the docker image for php"){
            agent any
            steps{
                script{
                    echo "Building the docker image"
                   withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                        sh "sudo docker build -t ${IMAGE_NAME} ."
                        sh 'sudo sudo docker login -u $USER -p $PASS'
                        sh "sudo docker push ${IMAGE_NAME}"
                }
                }
            }
        }
        stage("Deploy app via dockercompose file"){
            agent label{'linux_slave'}
            steps{
                script{
                    echo "deploy with dockercompose"
                    sh "bash ./remote-server.sh ${IMAGE_NAME}"
                }
            }
        }
    }
}
