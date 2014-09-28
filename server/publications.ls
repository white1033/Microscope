Meteor.publish 'posts' (limit) ->
  Posts.find {} do
    sort:
      submitted: -1
    limit: limit

Meteor.publish 'comments' (postId) ->
  Comments.find {postId}

Meteor.publish 'notifications' ->
  Notifications.find userId: @userId

Meteor.publish 'newPosts' (limit) ->
  Posts.find {}, {sort: {submitted: -1}, limit}

Meteor.publish 'topPosts' (limit) ->
  Posts.find {}, {sort: {votes: -1, submitted: -1}, limit}

Meteor.publish 'singlePost' (id) ->
  id and Posts.find id
