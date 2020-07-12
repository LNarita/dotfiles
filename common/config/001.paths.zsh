## --== User Env Config
VPN_CONFIG="$HOME/vpn"
export VPN_CONFIG

DEV_TOOLS_PATH="$HOME/dev-res"
APPS_PATH="$HOME/app"

export DEV_TOOLS_PATH
export APPS_PATH

JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
MAVEN_HOME="$DEV_TOOLS_PATH/maven"
PYENV_ROOT="$DEV_TOOLS_PATH/pyenv"
NVM_DIR="$DEV_TOOLS_PATH/nvm"
JAVA_CMD="$JAVA_HOME/bin/java"
ANACONDA_ROOT="$DEV_TOOLS_PATH/anaconda3"
CUSTOM_SCRIPTS_PATH="$DEV_TOOLS_PATH/bin/"

YTB_DL="$APPS_PATH/youtube-dl"

export DOCKER_COMPOSE_LOCATION=`whence docker.compose`
export DOCKER_LOCATION=`whence docker`

export JAVA_HOME
export PYENV_ROOT
export NVM_DIR
#export JAVA_CMD

PATH="$CUSTOM_SCRIPTS_PATH:$JAVA_HOME/bin:$YTB_DL:$ANACONDA_ROOT/bin:$PYENV_ROOT/bin:$PATH"

export PATH
