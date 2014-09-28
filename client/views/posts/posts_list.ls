Template.newPosts.helpers do
  options: ->
    sort:
      submitted: -1
    handle: newPostsHandle

Template.bestPosts.helpers do
  options: ->
    sort:
      votes: -1
      submitted: -1
    handle: topPostsHandle

Template.postsList.helpers do
  posts: ->
    Posts.find {} do
      sort: @sort
      limit: @handle.limit!

  postsReady: ->
    @handle.ready!

  allPostsLoaded: ->
    @handle.ready! and Posts.find!count! < @handle.loaded!

Template.postsList.events do
  'click .load-more': (event) ->
    event.preventDefault!
    @handle.loadNextPage!
