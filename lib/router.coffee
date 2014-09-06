Router.configure

  layoutTemplate: 'layout'
  waitOn: ->
    Meteor.subscribe 'images'


Router.map ->

  @route 'index',
    path: '/'
    data: ->
      posts: ->
        category = Session.get 'category'
        if category
          selector = {category: category}
        else
          selector = {}
        Posts.find(selector).fetch().filter( (e, i) -> i%2==0 ).reverse()
      posts2: ->
        category = Session.get 'category'
        if category
          selector = {category: category}
        else
          selector = {}
        Posts.find(selector).fetch().filter( (e, i) -> i%2!=0 ).reverse()

    waitOn: ->
      Meteor.subscribe 'posts'

