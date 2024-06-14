pipeline{
    agent any
    environment{
        REPO_URL = 'https://github.com/bawrostom/Simple_Jenkins'
        IMAGE_NAME = 'linux-builder'
        def dockerHome = tool 'mydocker'
        PATH = "${dockerHome}/bin:${env.PATH}"
    }
    stages{
        stage('Checkout'){
            steps{
                git url: "${env.REPO_URL}", branch: 'master'
            }
        }
        stage('Build'){
            steps{
                script{
                    sh 'echo Jenkins is well set up && docker build -t ${IMAGE_NAME} .'
                }
            }
        }
        stage('Run Docker container'){
            steps{
                script{
                    sh 'docker run --name img ${IMAGE_NAME} echo "Container Started"'
                    sh 'docker exec img linux-builder /bin/bash -c "gcc hellow.c -o hellow"  && ./hellow '
                }
            }
        }
        stage('Clean'){
            steps{
                script{
                sh 'docker rm -f img'
                }
            }
        }

    }
}