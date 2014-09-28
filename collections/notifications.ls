@Notifications = new Meteor.Collection 'notifications'

Notifications.allow do
  update: ownsDocument

@createCommentNotification = (comment) ->
  post = Posts.findOne comment.postId
  Notifications.insert do
    userId: post.userId
    postId: post._id
    commentId: comment._id
    commenterName: comment.author
    read: false
