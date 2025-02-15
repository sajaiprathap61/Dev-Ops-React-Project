pipeline {
    agent any
    environment {
        DOCKER_HUB_CREDENTIALS = 'dockerhub-credentials-id'
        GITHUB_CREDENTIALS = 'github-credentials-id'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'dev', url: 'https://github.com/yourusername/yourrepo.git'
            }
        }
        stage('Build Image') {
            steps {
                script {
                    def imageTag = "${env.BRANCH_NAME == 'dev' ? 'dev' : 'prod'}"
                    sh "./build.sh ${imageTag}"
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    def imageTag = "${env.BRANCH_NAME == 'dev' ? 'dev' : 'prod'}"
                    sh "docker push your-dockerhub-username/${imageTag}:latest"
                }
            }
        }
        stage('Deploy to Server') {
            when {
                branch 'dev'
            }
            steps {
                script {
                    sh "./deploy.sh ${imageTag}"
                }
            }
        }
    }
    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline execution failed!'
        }
    }
}

