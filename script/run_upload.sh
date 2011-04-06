#!/bin/bash

# Script to run the linz_bde_uploader perl script, rotating log files

SCRIPTDIR=$(dirname $(readlink -f $0))
cd $SCRIPTDIR

LOGDIR=../log
SCRIPTLOG=linz_bde_loader.log
RUNLOG=linz_bde_loader_run.log
LAST=11

for i in 10 9 8 7 6 5 4 3 2 1
do
   rm -f $LOGDIR/$SCRIPTLOG.$LAST >/dev/null 2>&1
   rm -f $LOGDIR/$RUNLOG.$LAST >/dev/null 2>&1
   mv $LOGDIR/$SCRIPTLOG.$i $SCRIPTLOG.$LAST >/dev/null 2>&1
   mv $LOGDIR/$RUNLOG.$i $RUNLOG.$LAST >/dev/null 2>&1
   LAST=$i
done


mv $LOGDIR/$SCRIPTLOG $SCRIPTLOG.1 >/dev/null 2>&1
mv $LOGDIR/$RUNLOG $RUNLOG.1 >/dev/null 2>&1

perl linz_bde_uploader.pl -verbose -listing $LOGDIR/$SCRIPTLOG $@ >$LOGDIR/$RUNLOG 2>&1