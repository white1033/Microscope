Template.comment.helpers do
  submittedText: ->
    new Date @submitted .toString!
