#!/bin/sh

BINDIR=$(dirname "$(readlink -fn "$0")")
cd "$BINDIR"
java -d64 -Xms1024M -Xmx1024M -jar craftbukkit.jar -o true
