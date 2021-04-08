#!/bin/sh

GOBREW_BIN_DIR=$HOME/.gobrew/bin
mkdir -p $GOBREW_BIN_DIR

GOBREW_ARCH_BIN=''

THISOS=$(uname -s)
case $THISOS in
   Linux*)
      GOBREW_ARCH_BIN="gobrew-linux-64"
      ;;
   Darwin*)
      GOBREW_ARCH_BIN="gobrew-darwin-64"
      ;;
   Windows*)
      GOBREW_ARCH_BIN="gobrew-windows-64.exe"
      ;;
esac

if [ -z "$GOBREW_VERSION" ]
then
      echo "using GOBREW_VERSION latest\n"
      GOBREW_VERSION=master
else
      echo "using GOBREW_VERSION $GOBREW_VERSION\n"
fi

curl -kLs https://raw.githubusercontent.com/kevincobain2000/gobrew/master/bin/$GOBREW_ARCH_BIN -o $GOBREW_BIN_DIR/gobrew

chmod +x $GOBREW_BIN_DIR/gobrew

echo "Installed successfully"

