pipeline {

    stages {

        def app

        stage('Clone repository') {
           steps {
                /* Let's make sure we have the repository cloned to our workspace */
                checkout scm
                }
        }

        stage('Copy custom conf') {
            steps {
            sh "cp config/php.conf.uploads.ini build_wordpress_php7.0-apache/php.conf.uploads.ini"
            }
        }

        stage('Build image') {
         def app
         steps {
            app = docker.build("nutellinoit/wordpress:php7.0-apache","--pull build_wordpress_php7.0-apache/")
            }
        }


        stage('Test image') {
            agent {
                docker {
                    image 'nutellinoit/wordpress:php7.0-apache'
                    reuseNode true
                }
            }
            steps {
                sh '/start.sh &'
                sh 'sleep 20'
                sh '/tests.sh'
            }
        }

        stage('Push image') {
        steps {
            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                app.push("php7.0-apache")
            }
            }
        }


    }
}