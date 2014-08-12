#!/bin/bash

if [ ! -n "$WERCKER_TWILIO_NOTIFY_SID" ]; then
	error 'Please specify key property.'
	exit 1
fi

if [ ! -n "$WERCKER_TWILIO_NOTIFY_TOKEN" ]; then
  error 'Please specify secret property.'
  exit 1
fi

if [ ! -n "$WERCKER_TWILIO_NOTIFY_FROM" ]; then
  error 'Please specify from property.'
  exit 1
fi

if [ ! -n "$WERCKER_TWILIO_NOTIFY_TO" ]; then
  error 'Please specify to property.'
  exit 1
fi


export  MESSAGE_BODY=`echo $WERCKER_STARTED_BY deployed $WERCKER_APPLICATION_NAME/$WERCKER_GIT_BRANCH to $WERCKER_DEPLOYTARGET_NAME`

if [ -n "$WERCKER_TWILIO_NOTIFY_DEPLOY_URL" ]; then
	MESSAGE_BODY=`echo $MESSAGE_BODY, see: $WERCKER_TWILIO_NOTIFY_DEPLOY_URL`
fi

MESSAGE_BODY=$( printf "%s\n" "$MESSAGE_BODY" | sed 's/ /%20/g' )

curl -X POST `echo https://api.twilio.com/2010-04-01/Accounts/$WERCKER_TWILIO_NOTIFY_SID/Messages -d "To=$WERCKER_TWILIO_NOTIFY_TO" -d "From=$WERCKER_TWILIO_NOTIFY_FROM" -d "Body=$MESSAGE_BODY" -u "$WERCKER_TWILIO_NOTIFY_SID:$WERCKER_TWILIO_NOTIFY_TOKEN"`
