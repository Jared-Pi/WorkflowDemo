pipeline {
    agent {
        docker { image 'testnode:16-alpine' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
    }
}