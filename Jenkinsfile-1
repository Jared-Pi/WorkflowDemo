pipeline {
    agent {
        docker {
            image 'jaredpi/dockins-agent:latest'
            label 'dockins-agent'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/Jared-Pi/workflowdemo.git', credentialsId: 'Jpi_github'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    docker.build("calculator-app:${env.BUILD_ID}")
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    docker.withRegistry('https://hub.docker.com/', 'docker-credentials') {
                        docker.image("calculator-app:${env.BUILD_ID}").run("--name Calculator-app -p 8080:8080")
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}