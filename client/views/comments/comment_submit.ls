Template.commentSubmit.events do
  'submit form': (event, template) ->
    event.preventDefault!

    comment =
      body: $ event.target .find '[name=body]' .val!
      postId: template.data._id

    Meteor.call 'comment' comment, (error, commentId) ->
      error and Errors.throw error.reason
