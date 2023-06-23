#!/bin/bash
printenv >> /etc/environment
/vsu/ingest.sh
cron -f