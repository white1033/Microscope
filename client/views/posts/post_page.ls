Template.postPage.helpers do
  currentPost: ->
    Posts.findOne Session.get 'currentPostId'

  comments: ->
    Comments.find postId: @_id
