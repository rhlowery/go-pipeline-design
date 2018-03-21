node {
  def DOCKER_REPO = 'rhlowery/go-pipeline-design'
  def version     = ''
  def img         = ''

  stage('build') {
    echo "Checking out source"
    checkout scm
    echo "Running Compile"
    sh 'make'
    echo "Getting Version Info"
    version = $(shell bin/$(BASE) version)
    echo "Running Compile"
    echo "Building Docker Image"
    // img = docker.build("${DOCKER_REPO}:${version}", "go-pipeline-design")
  }

  stage('unit-test') {
    echo "Running Unit Tests"
  }

  stage('publish') {
    echo "Publishing Docker Image"
    //docker.withRegistry('https://indexd.docker.io/v1/', 'sample-docker-registory-id') {
    //  img.push("${version}")
    //}
  }

  stage('deploy-dev') {
    echo "Destroying Dev Environment"
    // terraform destroy
    echo "Creating Dev Environment"
    // terraform create
    echo "Deploying Docker Image"
    // docker deploy
  }
  
  stage('static-analysis') {
    echo "Running Static Analysis"
    // sonarqube or other static analysis tool
  }

  stage('acceptance-test') {
    echo "Running Acceptance Tests / Full Regression"
  }

  stage('deploy-uat') {
    echo "Deploying to UAT"
    // terraform update
    // docker deploy
  }

  stage('deploy-prodA') {
    echo "Deploying to ProdA"
    // terraform update
    // docker deploy
  }

  stage('deploy-prodB') {
    echo "Deploying to ProdB"
    // terraform update
    // docker deploy
  }
}
