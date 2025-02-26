pipeline {
    agent {
        docker {
            image 'dockins-agent:latest'
            label 'dockins-agent'
        }
    }
    stages {
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
                    docker.withRegistry('', 'docker-credentials') {
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