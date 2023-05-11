export GOPATH="$HOME/go"
export GOROOT="$GOPATH/bin"
export GOROOT="/opt/homebrew/opt/go@1.20/libexec"
  
#export PATH="/opt/homebrew/opt/openjdk@18/bin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
  
export PATH="$HOME/flutter/bin:$PATH"
  #export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"0
export PATH="$PATH:$GOPATH/bin"

conda deactivate
# export JAVA_HOME=$(/usr/libexec/java_home)


jdk() {
 version=$1
 unset JAVA_HOME;
 export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
 java -version
}

export PATH="$PATH:$JAVA_HOME/bin"
