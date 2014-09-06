wildkp
======

野生柯P百科

[DEMO](http://wildkp.meteor.com)


### Development

We use mongo to store image in the developement enviroment

    meteor
    
    
### Deploy

We use S3 to store image in the production enviroment

Add settings.json first
    
    
    "public": {
      "uploadTo": "S3"
    },  
    "aws": {
      "accessKeyId": YOUR_ACCESSKEY_ID,
      "secretAccessKey": YOUR_SECRETE_ACCESSKEY,
      "bucket": YOUR_BUCKET
    }
  
Deploy to meteor.com

    meteor deploy --settings settings.json YOUR_DOMAIN_NAME.meteor.com
