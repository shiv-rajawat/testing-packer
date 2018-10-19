pipeline {
    agent any
    options {
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }
    
    stages {
    
        stage('Checkout') {
            steps {
              checkout scm
              load "$WORKSPACE/pipeline-vars.groovy"
            }
        }
        
        stage('Build') {
            steps {
                script {
                    run("build")
                }
            }
        }

        stage('Validate') {
            steps {
                script {
                   run("validate")
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    run("deploy")
                }
            }
        }
    }
}

def run(command) {
    PIPELINE_STEPS.each{ name, script ->
        if (name.toLowerCase().contains(command)) {                                              
            sh script
        }
    }
}

