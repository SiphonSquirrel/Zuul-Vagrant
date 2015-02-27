#!/bin/bash

if [[ ! -f $HOME/.m2/settings.xml ]]; then
	if [[ -f /vagrant/settings.xml ]]; then
		mkdir -p $HOME/.m2
		cp /vagrant/settings.xml $HOME/.m2
	fi
fi

cd /vagrant/Zuul-Src || exit 1
mvn install || exit 1
sudo service tomcat7 stop || exit 1
sudo rm -Rf /var/lib/tomcat7/webapps/ROOT/* || exit 1
sudo unzip zuul-web/target/zuul-web-*.war -d /var/lib/tomcat7/webapps/ROOT/ || exit 1
sudo service tomcat7 start || exit 1
