#!/bin/bash

path="~/maven/spring3hibernate/"
cd $path

if [ ! -f "${path}/pom.xml" ]
then
	exit 1
fi

function genreate_artifact () {
	mvn package
}

function install_artifact () {
	mvn install
}

function unit_test_case () {
	tool_argument=$1
	if [ ${tool_argument} == "checkstyle" ]
	then
		mvn checkstyle:checkstyle
	elif [ ${tool_argument} == "findbugs" ]
	then
		mvn findbugs:findbugs
	elif [ ${tool_argument} == "pmd" ]
	then
		mvn pmd:pmd
	fi
}

function unit_test_case_analysis () {
	unit_test_plugin_name=$1
	if [ ${unit_test_plugin_name} == "surefire" ]
	then
		mvn test surefire-report:report && mvn cobertura:cobertura
	fi                  
}

function deploy_the_artifact () {
	destination_path="/var/lib/tomcat9/webapps"
	if [ -n "${search_war}" ]
	then
		sudo cp $search_war $destination_path
	fi
}

while getopts "adis:t:" action;
do
	case $action in
		a)
			genreate_artifact
			;;
		i)
			install_artifact
			;;
		s)
			unit_test_case $OPTARG
			;;
		t)
			unit_test_case_analysis $OPTARG
			;;
		d)
			deploy_the_artifact $OPTARG
			;;
	esac
done