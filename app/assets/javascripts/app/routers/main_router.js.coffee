class App.Routers.MainRouter extends Backbone.Router

  routes:
    "": "index"

  initialize: ->
    @headerView = new App.Views.Header()
    @contentView = new App.Views.Content()
    @footerView = new App.Views.Footer()

  index: ->
    $('#header').html(@headerView.render().el)
    $('#content').html(@contentView.render().el)
    $('#footer').html(@footerView.render().el)
