pipeline {
    agent any

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
    }

    stage('Docker Build and Push') {
                steps {
                    script {
                        docker.build('jaredpi/workflowdemo:latest').push()
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