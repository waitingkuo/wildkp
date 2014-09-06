#imageStore = new FS.Store.FileSystem 'images', {path: '~/uploads'}

uploadTo = 'mongodb'

# upload files to S3
if uploadTo is 'S3'
  if Meteor.isServer

    imageStore = new FS.Store.S3 'images',
      accessKeyId: Meteor.settings.aws.accessKeyId
      secretAccessKey: Meteor.settings.aws.secretAccessKey
      bucket: Meteor.seetings.aws.bucket

    @Images = new FS.Collection 'images',
      stores: [imageStore]

  if Meteor.isClient

    imageStore = new FS.Store.S3 'images', {}
    @Images = new FS.Collection 'images',
      stores: [imageStore]

else if uploadTo is 'mongodb'
  # Upload files to mongodb
  imageStore = new FS.Store.GridFS 'images', {}
  @Images = new FS.Collection 'images',
    stores: [imageStore]


if Meteor.isServer
  Meteor.publish 'images', ->
    Images.find()
  Meteor.publish 'image', (imageId) ->
    Images.find imageId

Images.allow
  insert: -> true
  update: -> true
  download: -> true
