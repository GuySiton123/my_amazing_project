node {
	def commit_id
	def my_httpd
	stage('Defining commit id - for future use'){
		checkout scm
		sh "git rev-parse --short HEAD > .git/commit_id"
		commit_id = readFile('.git/commit_id').trim()
	}
	stage ('Set up the website container'){
		docker.build("guys99/my-website:${commit_id}",'.')
		my_httpd = docker.image("guys99/my-website:${commit_id}").run("-p 80:80")
	}
	stage ('Testing the website content'){
		sh "./content_test.sh"
	}
	stage ('Upload the image to docker hub'){
		my_httpd.stop()
		docker.withRegistry('https://index.docker.io/v1/', 'dockerhub'){
			def app = docker.image("guys99/my-website:${commit_id}").push()
		}                                     	
	}
}
