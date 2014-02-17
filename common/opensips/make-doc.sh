#!/bin/sh
for f in fragments/*.cfg; do
  egrep '^# Group:|^# Required|^ Status:|^# Name:|^# Description:|^# Note:' $f | sed -e 's/^# //';
  echo -n 'Routes: '; grep 'route\[' $f | wc -l;
  grep 'route\[' $f | sed -e 's/^/  /' | sed -e 's/\].*$/]/'
  echo -n 'Parameters: '; grep '\${' $f | sed -e 's/^.*\${/  /' | sed -e 's/}.*$//' | sort -u | wc -l;
  grep '\${' $f | sed -e 's/^.*\${/  /' | sed -e 's/}.*$//' | sort -u
  echo
done > ../../doc/opensips-fragments.txt
# Inside a group, only one module may be selected.
