pipeline {
    agent { node { label 'linux' }}                           			// ensure to select agent where terraform is installed
    
    stages {
        stage('Code Checkout') {
            steps {
                git 'https://github.com/15anshika/pinpoint-template-config'				// ensure to update repo URL where your code exists
            }
        }
        stage('Pinpoint script update') {
            steps {
				sh 'sudo chmod +x template_active_version_update.sh'
                sh 'template_active_version_update.sh input.txt'	
            }
        }
	}	
}
