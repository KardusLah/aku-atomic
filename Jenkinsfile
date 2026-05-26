pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "aku-atomic:latest"
        CONTAINER_NAME = "aku-atomic-web"
        HOST_PORT = "6969"
    }

    stage('Checkout') {
        steps {
            checkout([$class: 'GitSCM',
                branches: [[name: '*/master']],
                userRemoteConfigs: [[url: 'https://github.com/KardusLah/aku-atomic.git']]
            ])
        }
    }

        stage('Build Docker Image') {
            steps {
                script {
                    sh """
                    sudo docker build -t $DOCKER_IMAGE .
                    """
                }
            }
        }

        stage('Deploy to Nginx') {
            steps {
                script {
                    // Stop container lama kalau ada
                    sh """
                    sudo docker rm -f $CONTAINER_NAME || true
                    """

                    // Jalankan container baru dengan mapping port 6969 -> 80
                    sh """
                    sudo docker run -d --name $CONTAINER_NAME -p $HOST_PORT:80 $DOCKER_IMAGE
                    """
                }
            }
        }
    }

    post {
        success {
            echo "Deployment sukses ke Docker Nginx di port $HOST_PORT!"
        }
        failure {
            echo "Deployment gagal, cek log pipeline."
        }
    }
}
