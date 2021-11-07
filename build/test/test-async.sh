#!/bin/bash

LIB_DIR=/home/mikailg/ECE8930/install/lib64
BIN_DIR=/home/mikailg/ECE8930/install/bin
TEST_DIR=/home/mikailg/ECE8930/veloc_src/build/test
CFG=/home/mikailg/ECE8930/veloc_src/test/heatdis.cfg

export LD_LIBRARY_PATH=$LIB_DIR:$LD_LIBRARY_PATH
export VELOC_BIN=$BIN_DIR
rm -rf /tmp/scratch /tmp/persistent /tmp/meta
mkdir -p /tmp/scratch /tmp/persistent /tmp/meta

echo "First run (expected to fail):"
mpirun -np 2 $TEST_DIR/heatdis_fault 256 $CFG
rm -rf /tmp/scratch

echo "Second run (expected to succeed):"
mpirun -np 2 $TEST_DIR/heatdis_fault 256 $CFG
EXIT_CODE=$?
killall veloc-backend

echo "Log of backend:"
cat /dev/shm/veloc-backend-$HOSTNAME-$UID.log

exit $EXIT_CODE
