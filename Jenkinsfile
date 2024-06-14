pipeline{
    agent {
        docker { 
            image 'docker:24.0.2' 
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    environment{
        REPO_URL = 'https://github.com/bawrostom/Simple_Jenkins'
        IMAGE_NAME = 'linux-builder'
    }
    stages{
        stage('Checkout'){
            steps{
                git url: "env.REPO_URL", branch: 'master'
            }
        }
        stage('Build'){
            steps{
                script{
                    sh 'docker build -t ${IMAGE_NAME} .'
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