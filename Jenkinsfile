
pipeline {
    agent { label 'docker' }

    parameters {
        string(name: 'VERSION', defaultValue: '2.18.0', description: 'geoserver version')
    }

    stages {
        stage('Build and push image') {
            steps {
                script {
                    docker.withRegistry("${DOCKER_REGISTRY_URL}", "${DOCKER_REGISTRY_CREDENTIAL_ID}") {
                        def app = docker.build('mborne/geoserver',"--build-arg version=${params.VERSION} .")
                        app.push("${params.VERSION}")
                    }
                }
            }
        }
    }
}