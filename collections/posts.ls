@Posts = new Meteor.Collection 'posts'

Posts.allow do
  update: ownsDocument
  remove: ownsDocument

Posts.deny do
  update: (userId, post, fieldNames) ->
    _.without fieldNames, 'url', 'title' .length > 0

Meteor.methods do
  post: (postAttributes) ->
    user = Meteor.user!
    postWithSameLink = Posts.findOne url: postAttributes.url

    if not user
      throw new Meteor.Error 401 'You need to login to post new stories'

    if not postAttributes.title
      throw new Meteor.Error 422 'Please fill in a headline'

    if postAttributes.url and postWithSameLink
      throw new Meteor.Error 302 'This link has already been posted' do
        postWithSameLink._id

    post = postAttributes with do
      userId: user._id
      author: user.username
      submitted: new Date!getTime!
      commentsCount: 0
      upvoters: []
      votes: 0

    Posts.insert post

  upvote: (postId) ->
    user = Meteor.user!
    # ensure the user is logged in
    if not user
      throw new Meteor.Error 401 'You need to login to upvote'

    Posts.update {_id: postId, upvoters: {$ne: user._id}} do
      $addToSet:
        upvoters: user._id
      $inc:
        votes: 1
