pipeline {
  agent {
    docker {
      args '-p 80:7180'
      image 'golang-1.10.0-alpine3.7'
    }
    
  }
  stages {
    stage('Build') {
      steps {
        sh 'apk add --no-cache make'
        sh 'apk add --no-cache git'
        sh 'go get github.com/golang/dep/cmd/dep'
        sh 'go get -u golang.org/x/lint/golint'
      }
    }
  }
}
