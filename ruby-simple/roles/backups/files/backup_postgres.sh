#!/bin/bash -x


TODAY=`date +%F`
FILENAME=easypaint_api_${TODAY}.sql
WORKING_DIR=/home/deploy/database_backup

# take a sql dump of the database
/usr/bin/pg_dump easypaint_api > $WORKING_DIR/$FILENAME
if [ $? -ne 0 ]; then
    echo "pg_dump failed.  Exiting."
    curl -X POST -d "message=backup of postgres FAILED. pg_dump. $TODAY" https://easypaint.com/api/service/inform_team
    exit 1
fi

# upload backup file to google cloud storage
$WORKING_DIR/gsutil/gsutil cp $WORKING_DIR/$FILENAME gs://easypaint_backups/$FILENAME
if [ $? -ne 0 ]; then
    echo "gsutil failed.  Exiting."
    curl -X POST -d "message=backup of postgres FAILED. gsutil. $TODAY" https://easypaint.com/api/service/inform_team
    exit 1
fi

# Clean up
rm $WORKING_DIR/$FILENAME
curl -X POST -d "message=backup of postgres completed and uploaded to google cloud storage. $TODAY" https://easypaint.com/api/service/inform_team
