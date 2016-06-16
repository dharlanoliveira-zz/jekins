docker run -d  --name jenkins --env JAVA_OPTS="-Dhudson.Main.development=true -Djenkins.install.runSetupWizard=false" -p 8080:8080 -p 50000:50000 jenkins-tcu

if [ -f "./jenkins-cli.jar" ]
then
	echo "Arquivo de cliente já existente"
else
  echo "Baixando arquivo cliente"
  #wget http://localhost:8080/jnlpJars/jenkins-cli.jar
fi
