Template.header.helpers do
  activeRouteClass: (...args) ->
    args.pop!

    active = _.any args, (name) ->
      location.pathname == Router.routes[name].path!

    active and 'active'
