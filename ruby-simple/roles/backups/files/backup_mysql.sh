#!/bin/bash

TODAY=`date +%F`
FILENAME=easypaint_blog_${TODAY}.sql
WORKING_DIR=/home/deploy/database_backup

# take a sql dump of the database
mysqldump -u root -pprivetrivet easypaint_blog > $WORKING_DIR/$FILENAME
if [ $? -ne 0 ]; then
    echo "mysqldump failed.  Exiting."
    curl -X POST -d "message=backup of mysql FAILED.(mysqldump) $TODAY" https://easypaint.com/api/service/inform_team
    exit 1
fi

# upload backup file to google cloud storage
$WORKING_DIR/gsutil/gsutil cp $WORKING_DIR/$FILENAME gs://easypaint_backups/$FILENAME
if [ $? -ne 0 ]; then
    echo "gsutil failed.  Exiting."
    curl -X POST -d "message=backup of mysql FAILED.(gsutil) $TODAY" https://easypaint.com/api/service/inform_team
    exit 1
fi

# Clean up
rm $WORKING_DIR/$FILENAME
curl -X POST -d "message=backup of postgres completed and uploaded to google cloud storage. $TODAY" https://easypaint.com/api/service/inform_team

