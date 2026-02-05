#!/bin/bash

LOG_SECTION () {
  printf '=%.0s' {1..80}; printf '\n'
  echo "[INFO] "$*" ..."
  printf '=%.0s' {1..80}; printf '\n'
}

LOG_SUBSECTION () {
  printf -- '-%.0s' {1..80}; printf '\n'
  echo "[INFO] "$*" ..."
  printf -- '-%.0s' {1..80}; printf '\n'
}

if [ "$1" == "dependencies" ]; then
  LOG_SECTION "Dependencies"

  LOG_SUBSECTION "Python "
  COMMAND="python"
  if ! command -v $COMMAND >/dev/null 2>&1
  then
    echo "[ERROR] '$COMMAND' could not be found"
    exit 1
  else
    echo "- '$COMMAND' found at `command -v $COMMAND`"
  fi
  ver=$(python -c"import sys; print(sys.version_info.major)")
  if [ $ver -ne 3 ]; then
      echo "[ERROR] 'python' major version is not '3'"
      exit 1
  else 
      echo "- 'python' version is `python -V`"
  fi

  LOG_SUBSECTION "NPM - Installing modules"
  COMMAND="npm"
  if ! command -v $COMMAND >/dev/null 2>&1
  then
    echo "'$COMMAND' could not be found"
    exit 1
  else
    echo "- '$COMMAND' found at `command -v $COMMAND`"
  fi
  npm i



fi 

if [ "$1" == "build" ]; then

  # echo ===========================================================================
  # echo "[INFO] Building ..."
  # echo ===========================================================================
  # rm -rf build
  # cmake -B build -DCMAKE_BUILD_TYPE=Release
  # cmake --build build

fi

if [ "$1" == "install" ]; then

  # echo ===========================================================================
  # echo "[INFO] Installing ..."
  # echo ===========================================================================
  # rm -rf build
  # cmake -B build -DCMAKE_BUILD_TYPE=Release
  # cmake --build build

  # if [[ "$OSTYPE" == "linux-gnu" ]]; then
  #   echo "Here"
  # elif [[ "$OSTYPE" == "darwin" ]]; then
  #         # Mac OSX
  #   echo "Here"
  # elif [[ "$OSTYPE" == "cygwin" ]]; then
  #         # POSIX compatibility layer and Linux environment emulation for Windows
  #   echo "Here"
  # elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
  #   cmake.exe -B build -DCMAKE_INSTALL_PREFIX="$LOCALAPPDATA"/SignalRegistry  
  #         # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
  # elif [[ "$OSTYPE" == "win32" ]]; then
  #         # I'm not sure this can happen.
  #   echo "Here"
  # elif [[ "$OSTYPE" == "freebsd" ]]; then
  #         # ...
  #   echo "Here"
  # else
  #         # Unknown.
  #   echo "Here"
  # fi
  # cmake --build build --config Release --target INSTALL

fi

if [ "$1" == "publish" ]; then

  # echo ===========================================================================
  # echo "[INFO] Pıblishing ..."
  # echo ===========================================================================
  # VERSION=`cat VERSION`
  # RELEASE=`git tag -l | tail -1`
  # if [ "$RELEASE" = "" ];then
  #   gh release create "v$VERSION" --generate-notes
  # else 
  #   gh release create "v$VERSION" --generate-notes --notes-start-tag `git tag -l | tail -1`
  # fi
  # git fetch --tags origin
  # # echo $VERSION
  # # cd build
  # # cpack --config CPackConfig.cmake 
  # # cd ..
  # # if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # #       # ...
  # # elif [[ "$OSTYPE" == "darwin"* ]]; then
  # #         # Mac OSX
  # # elif [[ "$OSTYPE" == "cygwin" ]]; then
  # #         # POSIX compatibility layer and Linux environment emulation for Windows
  # # elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
  # #         # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
  # # elif [[ "$OSTYPE" == "win32" ]]; then
  # #         # I'm not sure this can happen.
  # # elif [[ "$OSTYPE" == "freebsd"* ]]; then
  # #         # ...
  # # else
  # #         # Unknown.
  # # fi

fi

if [ "$1" == "unpublish" ]; then

  # echo ===========================================================================
  # echo "[INFO] Remove Publishing ..."
  # echo ===========================================================================
  # RELEASE=`git tag -l | tail -1`
  # gh release delete $RELEASE -y && git push --delete origin $RELEASE && git tag -d $RELEASE 

fi