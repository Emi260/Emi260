pipeline {
    agent any
    stages {
        stage ('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Emi260/Liquibase.git'
            }
        }
        stage ('Update') {
            steps {
                step([$class: 'UpdateBuilder', 
                changeLogFile: 'samplechangelog.XML', 
                url: 'jdbc:sqlserver://localhost\\SQLEXPRESS01:1434;databaseName=liquibase', 
                credentialsId: '7e33c333-8966-4c46-b0c5-296d83a2b20a', 
                installationName: 'Liquibase 4.3.1',
                resourceDirectories: "${WORKSPACE}"])
            }
        }
        stage ('Tag') {
            steps {
                step([$class: 'TagBuilder', 
                changeLogFile: 'samplechangelog.XML', 
                url: 'jdbc:sqlserver://localhost\\SQLEXPRESS01:1434;databaseName=liquibase', 
                credentialsId: '7e33c333-8966-4c46-b0c5-296d83a2b20a', 
                installationName: 'Liquibase 4.3.1',
                resourceDirectories: "${WORKSPACE}"])
            }
        }
    }
}
