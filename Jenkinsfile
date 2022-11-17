pipeline{
  agent any
  stages{
    stage('build project / generate dist'){
      steps{
        sh 'npm install ; ansible-playbook Ansible/build.yml -i Ansible/inventory/host.yaml -e "ansible_become_password=toor"'
      }
    }
    stage('build docker image / run container'){
      steps{
        sh 'npm install ; docker login ; ansible-playbook Ansible/docker.yml -i Ansible/inventory/host.yaml -e "ansible_become_password=toor"'
      }
    }
    stage('push docker image'){
      steps{
        sh 'npm install ; docker login ; ansible-playbook Ansible/docker-registry.yml -i Ansible/inventory/host.yaml -e "ansible_become_password=toor"'
      }
    }
  }
  post {
     always{
            script 
            {
            def url = "${env.BUILD_URL}"
            def status = currentBuild.currentResult
            def color = status == 'SUCCESS' ? '#00FF00' : '#FF0000'
            def resultIcon = status == 'SUCCESS' ? ':white_check_mark:' : ':anguished:'
            slackSend (message: "${resultIcon} Jenkins Build $currentBuild.currentResult\n\nResults available at: [ Jenkins-$env.JOB_NAME#$env.BUILD_NUMBER ] \n ${url}", 
                        color: color)
            }
          }
  }
}
