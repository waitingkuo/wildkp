@Posts = new Meteor.Collection 'posts',
  schema:
    content:
      type: String
    imageId:
      type: String
      optional: true
    url:
      type: String
      optional: true
    category:
      type: String
      #allowedValues: ['wild', 'raise', 'herd', 'more']
      allowedValues: ['wild', 'raise', 'herd', 'more']
      autoform:
        options: [
          {label: '野生柯P', value: 'wild'}
          {label: '養殖柯P', value: 'raise'}
          {label: '牧放柯P', value: 'herd'}
          {label: '更多柯P', value: 'more'}
        ]


if Meteor.isClient
  AutoForm.hooks
    newPost:
      onSuccess: (a, b, template) ->
        Session.set 'uploaded', false

Posts.allow

  insert: -> true
