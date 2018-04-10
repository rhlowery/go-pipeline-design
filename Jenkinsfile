pipeline {
  agent none

  environment {
    VERSION = '0.0.1'
  }

  options {
    buildDiscarder(logRotator(numToKeepStr: '10'))
  }

  stages {
    stage('Build') {
      agent {
        docker {
          image 'golang:1.10.1-alpine3.7'
        }
      }
      steps {
        sh 'apk add --no-cache make'
        sh 'apk add --no-cache git'
        sh 'go get github.com/golang/dep/cmd/dep'
        sh 'go get -u golang.org/x/lint/golint'
        sh 'go get -u github.com/DATA-DOG/godog/...'
        sh 'make clean'
        sh 'make'
      }
    }
    stage('Package') {
      agent {
        dockerfile {
          filename 'Dockerfile'
        }
      }
      environment {
        dir = 'build'
        label = 'rhlowery/go-pipeline-design'
        additionalBuildArgs = '--build-arg version=${VERSION}'
      }
      steps {
        echo "${VERSION}"
      }
    }
    stage('Test') {
      agent {
        docker {
          image 'golang:1-10.1-alpine3.7'
        }
      }
      steps {
        sh 'make test'
        sh 'mkdir test'
        sh 'make test-xml'
        sh 'make test-coverage'
      }
    }
  }
  post {
    always {
      junit 'test/tests.xml'
      
    }
    
  }
}
