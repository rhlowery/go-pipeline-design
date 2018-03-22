pipeline {
  agent {
    docker {
      image 'golang-1.10.0-alpine-3.7'
      args '-p 80:7180'
    }
    
  }
  stages {
    stage('Build') {
      steps {
        sh '''make clean
make'''
      }
    }
  }
}