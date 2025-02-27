pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                withMaven {
                    sh 'mvn clean install'
                }
            }
        }
        stage('Test') {
            steps {
                withMaven {
                    sh 'mvn test'
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