#!/usr/bin/env bash
while true; do
  clear
  javac *.java && echo "Compilazione eseguita
----------------------------" && java Main;
  echo "Premere invio per continuare . . .";
  read
done
