Template.postSubmit.events do
  'submit form': (event) ->
    event.preventDefault!

    post =
      url: $ event.target .find '[name=url]' .val!
      title: $ event.target .find '[name=title]' .val!
      message: $ event.target .find '[name=message]' .val!

    Meteor.call 'post' post, (error, id) ->
      if error
        Errors.throw error.reason

        if error.error is 302
          Router.go 'postPage' _id: error.details
      else
        Router.go 'postPage' _id: id
