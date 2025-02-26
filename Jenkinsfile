pipeline {
    agent {
        docker {
            image 'dockins-agent:latest'
            label 'dockins-agent'
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