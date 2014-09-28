Handlebars.registerHelper 'pluralize' (n, thing) ->
  if n == 1
    "#n #thing"
  else
    "#n #{thing}s"
