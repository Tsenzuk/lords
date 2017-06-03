#!/bin/bash
URL=https://subversion.assembla.com/svn/the-lords/trunk/ai/
DOCKER=${1:-not_docker}

killall java

if [ "$DOCKER" = "docker" ]; then
cd /tmp
fi

rm -r ai
mkdir ai

rm -r ai_bin
mkdir ai_bin

if [ "$DOCKER" = "docker" ]; then
    cp -R /ai /tmp
else
    svn co $URL ./ai --username lords_checkouter --password c2h5oh
    svnversion ./ai > ./ai_bin/revision.txt
fi


javac -cp ./ai/lib/json-simple-1.1.1.jar:./ai_bin -d ./ai_bin ./ai/src/ai/paths_finding/astar/*.java
javac -cp ./ai/lib/json-simple-1.1.1.jar:./ai_bin -d ./ai_bin ./ai/src/ai/paths_finding/jump_point_search/*.java
javac -cp ./ai/lib/json-simple-1.1.1.jar:./ai_bin -d ./ai_bin ./ai/src/ai/paths_finding/*.java
javac -cp ./ai/lib/json-simple-1.1.1.jar:./ai_bin -d ./ai_bin ./ai/src/ai/*.java

java -cp ./ai_bin:./ai/lib/json-simple-1.1.1.jar -Djava.util.logging.config.file=./ai/logging.properties ai.AiServicePublisher &

if [ "$DOCKER" = "docker" ]; then
while true; do sleep 1000; done
fi
