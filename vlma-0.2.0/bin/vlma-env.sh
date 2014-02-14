# Find the JAVA executable
if [ -z "$JAVA_HOME" ]
then
    echo "[ERROR] JAVA_HOME is not defined."
    echo "[ERROR] You either need to install a JDK 5.0 or later,"
    echo "[ERROR] or to set the JAVA_HOME environment variable if a JDK is already installed."
    exit 1
fi

JAVA="$JAVA_HOME/bin/java"

if [ ! -x "$JAVA" ]
then
    echo "[ERROR] Cannot find the JAVA executable."
    echo "[ERROR] Please verify that JAVA_HOME really points to a JDK installation."
    exit 1;
fi

function check_dir() {
    dir=$1
    if [ ! -d "$dir" ]
    then
        echo "[ERROR] $dir does not exist."
        echo "This directory is required for VLMa to run. Please create it before running VLMa again."
        exit 1
    fi
}

PRG="$0"
PRGDIR=`dirname $PRG`

[ "$VLMA_HOME" != "" ] || VLMA_HOME=`cd "$PRGDIR/.."; pwd`
check_dir $VLMA_HOME
echo "[INFO] Using VLMA_HOME: $VLMA_HOME"

[ "$VLMA_CONF" != "" ] || VLMA_CONF="$VLMA_HOME/conf"
check_dir $VLMA_CONF
echo "[INFO] Using VLMA_CONF: $VLMA_CONF"

[ "$VLMA_DATA" != "" ] || VLMA_DATA="$VLMA_HOME/data"
check_dir $VLMA_DATA
echo "[INFO] Using VLMA_DATA: $VLMA_DATA"

[ "$VLMA_LIBS" != "" ] || VLMA_LIBS="$VLMA_HOME/lib"
check_dir $VLMA_LIBS
echo "[INFO] Using VLMA_LIBS: $VLMA_LIBS"

[ "$VLMA_LOGS" != "" ] || VLMA_LOGS="$VLMA_HOME/logs"
check_dir $VLMA_LOGS
echo "[INFO] Using VLMA_LOGS: $VLMA_LOGS"

[ "$VLMA_WEBAPPS" != "" ] || VLMA_WEBAPPS="$VLMA_HOME/webapps"
check_dir $VLMA_WEBAPPS
echo "[INFO] Using VLMA_WEBAPPS: $VLMA_WEBAPPS"

