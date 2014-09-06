#Template.posts.helpers

#  posts: ->
#    Posts.find().fetch().reverse()
#
Template.header.events
  'click .cat': (e) ->
    cat = $(e.currentTarget).data('category')
    Session.set 'category', cat


Template.post.helpers
  url: ->
    window.p = @
    if @imageId
      image = Images.findOne @imageId
      if image
        return image.url()
      return ''
    return ''

  catLabel: ->
    if @category == 'wild'
      return 'label-danger'
    if @category == 'raise'
      return 'label-primary'
    if @category == 'herd'
      return 'label-warning'
    if @category == 'more'
      return 'label-info'
    return 'label-info'


  catName: ->
    if @category == 'wild'
      return '野生柯P'
    if @category == 'raise'
      return '養殖柯P'
    if @category == 'herd'
      return '牧放柯P'
    if @category == 'more'
      return '更多柯P'
    return '更多柯P'


Template.newPost.helpers

  uploaded: -> Session.get 'uploaded'
  url: ->
    Session.get 'url'

Template.newPost.events
  
  'change .file': (e, template) ->

    FS.Utility.eachFile e, (file) ->
      Images.insert file, (err, fileObj) ->
        if not err
          #$('#newPost').find('input[name="url"]').val fileObj.url()
          $('#newPost').find('input[name="imageId"]').val fileObj._id
          Session.set 'uploaded', true
          handle = setInterval ( ->
            url = fileObj.url()
            Session.set 'url', fileObj.url()
            if url
              woo()
            console.log 'uploading...'
          ), 1000
          woo = -> clearInterval handle



      
