pipeline {
  agent none
  stages {
    stage('Build') {
      agent {
        docker {
          image 'golang:1.10.0-alpine3.7'
        }
      }
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
      agent {
        dockerfile {
          filename 'Dockerfile'
          dir 'build'
          label 'go-pipeline-design'
          additionalBuildArgs '--build-arg version=${VERSION}'
        }
      }
    }
    stage('Test') {
      agent {
        docker {
          image: go-pipeline-design:${VERSION}
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
