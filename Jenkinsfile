node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }

    stage('Copy custom conf') {
        sh "cp config/php.conf.uploads.ini build_wordpress_php7.0-apache/php.conf.uploads.ini"
    }

    stage('Build image') {
        app = docker.build("nutellinoit/wordpress:php7.0-apache","--pull build_wordpress_php7.0-apache/")
    }


   stage('Test image') {

    app.inside {
        sh 'number=$(curl -L http://localhost 2>&1 | grep wp-admin | wc -l)'
        sh 'if [ $number -gt 1 ]; then echo "OK"; else exit 125; fi'
    }
}


    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("php7.0-apache")
        }
    }
}
