Template.notifications.helpers do
  notifications: ->
    Notifications.find userId: Meteor.userId!, read: false

  notificationCount: ->
    Notifications.find userId: Meteor.userId!, read: false .count!

Template.notification.events do
  'click a': ->
    Notifications.update @_id, $set: {+read}
