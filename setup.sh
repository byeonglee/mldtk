JAVA_DEV_ROOT=${PWD}
if [[ ! -e classes ]];then mkdir classes;fi
CLASSPATH=${JAVA_DEV_ROOT}/classes:${JAVA_DEV_ROOT}/bin/junit.jar:${JAVA_DEV_ROOT}/bin/javabdd.jar:${JAVA_DEV_ROOT}/bin/sqlite-jdbc-3.36.0.3.jar
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
PATH_SEP=:
LD_LIBRARY_PATH=${JAVA_DEV_ROOT}/bin:$LD_LIBRARY_PATH
export JAVA_DEV_ROOT CLASSPATH JAVA_HOME PATH_SEP OSTYPE
