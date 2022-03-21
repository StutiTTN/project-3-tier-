pipeline {
   agent any
 
   stages {
       stage('checkout') {
           steps {
               checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/StutiTTN/project-WORKSHOP.git']]])
             
           }
       }
      
       stage ("Terraform init") {
           steps {
               sh ("terraform init");
           }
       }
      
       stage ("Terraform Action") {
           steps {
               echo"terraform action from the parameter is ---> ${action}"
               sh ("terraform ${action} --auto-approve");
           }
       }  
      
   }
}
