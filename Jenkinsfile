pipeline {
  agent {
    docker {
      args '-p 80:7180'
      image 'golang:1.10.0-alpine3.7'
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