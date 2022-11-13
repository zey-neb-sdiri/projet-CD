pipeline{
  agent any
  stages{
    stage('build project / generate dist'){
      steps{
        sh 'ansible-playbook Ansible/build.yml -i Ansible/inventory/host.yaml'
      }
    }
  }
}
