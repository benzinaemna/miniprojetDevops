pipeline {
agent any
environment {
  def DOCKER_TAG = getVersion()
}
stages {
stage ('Clone Stage') {
steps {
   git branch:'main',url:'https://github.com/benzinaemna/miniprojetDevops.git'
}
}
  stage ('Docker Build') {
    steps {
        sh 'docker build -t emnabenzina/spring:${DOCKER_TAG} .'
    }
}
    stage ('DockerHub Push') {
    steps {
        withCredentials([string(credentialsId: 'emnabenzina', variable: 'dockerHubPwd')]) {
            sh "docker login -u emnabenzina -p ${dockerHubPwd}"
}
         sh "docker push emnabenzina/spring:${DOCKER_TAG}"

}
}
  stage ('Pre_Deploy') {
      steps {
        
         sshagent(credentials: ['Vagrant_ssh1']) {
          sh 'echo hello'
   sh "ssh -T vagrant@192.168.1.18 'sudo docker --version'"
         }
      }
  }
    stage ('Deploy') {
    steps{
        sshagent(credentials: ['Vagrant_ssh1']) {
        sh 'echo hello'
        sh "ssh -T vagrant@192.168.1.18 'sudo docker run -d -p 8888:8888 emnabenzina/spring'"
}
}
}
}
}
def getVersion() {
    def version = sh returnStdout: true, script: 'git rev-parse --short HEAD'
    return version.trim()
}

