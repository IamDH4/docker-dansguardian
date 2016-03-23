#!/bin/bash
if [ "$(pidof dansguardian)" ] 
then
  echo -e "Restarting DansGuardian... \c"
  dansguardian -q
else
  echo -e "DansGuardian not running, starting... \c"
fi

while [ "$(pidof dansguardian)" ] 
do
  sleep .1
done
dansguardian
echo "done."

