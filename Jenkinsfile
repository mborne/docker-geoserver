pipeline {
    agent { label 'docker' }

    // environment {
    //     DOCKER_REGISTRY_URL = 'https://registry.quadtreeworld.net'
    //     DOCKER_REGISTRY_CREDENTIAL_ID = 'nexus_user'
    // }

    stages {
        stage('mborne/geoserver:2.21.1') {
            steps {
                buildAndPushVersion("2.21.1","2.21")
            }
        }

        stage('mborne/geoserver:2.21.1') {
            steps {
                buildAndPushVersion("2.21.1","2.21")
            }
        }
    }
}

void buildAndPushVersion(version,majorVersion){
    script {
        def build_args="--pull --build-arg version=${version} "
        docker.withRegistry("${DOCKER_REGISTRY_URL}", "${DOCKER_REGISTRY_CREDENTIAL_ID}") {
            def app = docker.build('mborne/geoserver', " ${build_args} .")
            app.push("${version}")
            app.push("${majorVersion}")
        }
    }
}
