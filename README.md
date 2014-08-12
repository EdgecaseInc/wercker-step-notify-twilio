twilio-notify
===========================

Build Notifications through Twilio SMS


Example
--------

Add TWILIO_KEY, TWILIO_SECRET, SMS_FROM, SMS_TO as deploy target or application environment variables.
`deploy-url` is optional.

```
    - edgecaseadmin/twilio-notify:
        sid: $TWILIO_KEY
        token: $TWILIO_SECRET
        from: $TWILIO_FROM
        to: $TWILIO_TO
        deploy-url: 'http://example.com/deployed_app'
```