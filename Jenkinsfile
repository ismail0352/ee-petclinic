pipeline {
    agent { label: master }
    stages {
        stage('checkout') {
            steps {
                checkout([$class: 'GitSCM',
                branches: [[name: '*/master']],
                doGenerateSubmoduleConfigurations: false,
                extensions: [],
                submoduleCfg: [],
                userRemoteConfigs: [[url: 'https://github.com/spring-projects/spring-petclinic.git']]])
            }
        }

        stage('Build') {
            steps {
                sh './mvnw package'
            }
        }

        stage('') {
            steps {
                echo "copy to mnt"
            }
        }
    }
}