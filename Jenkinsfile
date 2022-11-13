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
  }
}
