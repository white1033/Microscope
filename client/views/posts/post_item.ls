Template.postItem.helpers do
  ownPost: ->
    @userId is Meteor.userId!

  domain: ->
    a = document.createElement 'a'
    a.href = @url
    a.hostname

  upvotedClass: ->
    userId = Meteor.userId!
    if userId and not (userId in @upvoters)
      'btn-primary upvoteable'
    else
      'disabled'

Template.postItem.events do
  'click .upvote': (event) ->
    event.preventDefault!
    Meteor.call 'upvote' @_id
