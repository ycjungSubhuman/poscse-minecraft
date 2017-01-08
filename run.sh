#!/bin/sh

BINDIR=$(dirname "$(readlink -fn "$0")")
cd "$BINDIR"
java -d64 -Xms1536M -Xmx1536M -jar craftbukkit.jar -o true
