#!/bin/bash

source /opt/perlbrew/etc/bashrc

echo "HARNESS_OPTIONS=j$JOBS perlbrew -j$JOBS $FORCE $NOTEST install perl-$VERSION"
HARNESS_OPTIONS=j$JOBS perlbrew -j$JOBS $FORCE $NOTEST install perl-$VERSION
rv=$?
if [ "$rv" != "0" ]; then 
    cat /opt/perlbrew/build.*.log
    echo $rv
    exit 1 
else 
    perlbrew clean 
    rm -f /opt/perlbrew/build.*.log
    PERL_VERSION=`ls /opt/perlbrew/perls | cut -d '-' -f 2`
fi
