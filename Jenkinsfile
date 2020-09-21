pipeline {
	agent any
	stages {
		stage ('Set up the website container'){
			steps {
				docker.build("guys99/my-website:1",'.')
				docker.image("guys99/my-website:1").run("-p 80:80")
			}
		}
		stage ('Testing the website content'){
			steps {
				sh "./content_test.sh"
			}
		}
		stage ('Upload the image to docker hub'){
			steps {
				docker.withRegistry('https://index.docker.io/v1/', 'dockerhub'){
					def app = docker.image("guys99/my-website:1").push()
				}
     			}                                     	
		}
	}
}
