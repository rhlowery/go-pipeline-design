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
        sh 'apk add --no-cache make'
        sh 'apk add --no-cache git'
        sh 'go get github.com/golang/dep/cmd/dep'
        sh 'go get -u golang.org/x/lint/golint'
        sh 'make clean'
        sh 'make'
      }
    }
    stage('Package') {
      steps {
        sh 'apk add --no-cache docker'
        sh 'docker build .'
      }
    }
    stage('Test') {
      steps {
        sh 'make test'
        sh 'make test-coverage'
      }
    }
  }
}