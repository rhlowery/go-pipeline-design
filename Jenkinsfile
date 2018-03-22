pipeline {
  agent {
    docker {
      image 'golang:1.10.0-alpine3.7'
      args '-p 7180:80'
    }
    
  }
  stages {
    stage('Build') {
      steps {
        sh 'make clean'
        sh 'make'
      }
    }
  }
}