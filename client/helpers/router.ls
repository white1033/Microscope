IR_BeforeHooks =
  requireLogin: (pause) ->
    if Meteor.user!
      @render!
    else if Meteor.loggingIn!
      @render 'loading'
      pause!
    else
      @render 'accessDenied'
      pause!

  clearErrors: ->
    Errors.clearSeen!

Router.configure do
  layoutTemplate: 'layout'

Router.map ->
  @route 'home' do
    path: '/'
    template: 'bestPosts'

  @route 'bestPosts' do
    path: '/best'

  @route 'newPosts' do
    path: '/new'

  @route 'postPage' do
    path: '/posts/:_id'
    onRun: ->
      Session.set 'currentPostId' @params._id

  @route 'postEdit' do
    path: '/posts/:_id/edit'
    onRun: ->
      Session.set 'currentPostId' @params._id

  @route 'postSubmit' do
    path: '/submit'


Router.onBeforeAction IR_BeforeHooks.requireLogin, only: 'postSubmit'
Router.onBeforeAction IR_BeforeHooks.clearErrors
