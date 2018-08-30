node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }

    stage('Copy custom conf') {
        sh "cp config/php.conf.uploads.ini build_wordpress_php7.0-apache/php.conf.uploads.ini"
        sh "cp config/php.conf.uploads.ini build_wordpress_php5.6-apache/php.conf.uploads.ini"
    }

    stage('Build image 5.6-apache') {
            app = docker.build("nutellinoit/wordpress:php5.6-apache","--pull build_wordpress_php5.6-apache/")
        }


    stage('Push image 5.6-apache') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("php5.6-apache")
            app.push("php5.6-apache-dev-${env.BUILD_NUMBER}")
        }
    }

    stage('Build image 7.0-apache') {
        app = docker.build("nutellinoit/wordpress:php7.0-apache","--pull build_wordpress_php7.0-apache/")
    }


    stage('Push image 7.0-apache') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("php7.0-apache")
            app.push("php7.0-apache-dev-${env.BUILD_NUMBER}")
        }
    }


    stage('Copy custom conf prod') {
            sh "cp config/php.prod.ini build_wordpress_php7.0-apache/php.conf.uploads.ini"
        }

    stage('Build image 7.0-apache-prod') {
            app = docker.build("nutellinoit/wordpress:php7.0-apache-prod","--pull build_wordpress_php7.0-apache/")
        }


        stage('Push image 7.0-apache-prod') {
            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                app.push("php7.0-apache-prod")
                app.push("php7.0-apache-prod-dev-${env.BUILD_NUMBER}")
            }
        }
}

