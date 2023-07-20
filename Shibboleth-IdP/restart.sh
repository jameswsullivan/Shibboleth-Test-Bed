printf "\n----RESTART SERVER AND VERIFY CONFIGS----\n"

printf "\nwebapps folder:\n"
ls -al /usr/local/tomcat/webapps/

printf "\naccess-control.xml:\n"
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

printf "\nShutdown Tomcat:\n"
/usr/local/tomcat/bin/shutdown.sh
printf "\nStart Tomcat:\n"
/usr/local/tomcat/bin/startup.sh