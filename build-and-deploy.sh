cd /vagrant/Zuul-Src || exit 1
mvn install || exit 1
sudo rm -Rf /var/lib/tomcat7/webapps/ROOT/* || exit 1
sudo unzip zuul-web/target/zuul-web-*.war -d /var/lib/tomcat7/webapps/ROOT/ || exit 1
sudo service tomcat7 stop || exit 1
sudo cp -f /vagrant/zuul-data-config.properties /usr/share/tomcat7/lib/ || exit 1
sudo service tomcat7 start || exit 1
