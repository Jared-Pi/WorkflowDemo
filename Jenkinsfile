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
        stage('Print Credentials') {
            steps {
                script {
                    def creds = com.cloudbees.plugins.credentials.CredentialsProvider.lookupCredentials(
                        com.cloudbees.plugins.credentials.common.StandardUsernamePasswordCredentials.class,
                        Jenkins.instance
                    )
                    creds.each { c ->
                        echo "Credentials ID: ${c.id}"
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-credentials') {
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