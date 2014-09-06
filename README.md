wildkp
======

野生柯P百科


### Development

  meteor
    
    
### Deploy

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
