printf "\nInstall Shibboleth-IdP:\n"
/opt/shib_install/bin/install.sh

printf "\nDeploy the idp.war file:\n"
cp /opt/shibboleth-idp/war/idp.war /usr/local/tomcat/webapps/idp.war

printf "\nidp.war deployed:\n"
ls -al /usr/local/tomcat/webapps/

cp /opt/custom_config/access-control.xml /opt/shibboleth-idp/conf/access-control.xml
printf "\naccess-control.xml deployed:\n"
cat /opt/shibboleth-idp/conf/access-control.xml

printf "\nJava and Tomcat ENVs:\n"
printf "\nJava Version:\n"
java -version

printf "\nJAVA_HOME:\n"
echo $JAVA_HOME
printf "\nPATH:\n"
echo $PATH
printf "\nJAVA_OPTS:\n"
echo $JAVA_OPTS
printf "\nCATALINA_BASE:\n"
echo $CATALINA_BASE
printf "\nCATALINA_HOME:\n"
echo $CATALINA_HOME
printf "\nCATALINA_TMPDIR:\n"
echo $CATALINA_TMPDIR
printf "\nCATALINA_OPTS:\n"
echo $CATALINA_OPTS

printf "\n/etc/environment:\n"
cat /etc/environment
printf "\ncat /etc/hosts:\n"
cat /etc/hosts

printf "\nStart Tomcat:\n"
/usr/local/tomcat/bin/startup.sh