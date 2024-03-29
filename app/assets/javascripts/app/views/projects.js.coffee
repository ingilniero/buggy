class App.Views.Projects extends Backbone.View

  template: HandlebarsTemplates['app/templates/projects']

  events:
    "click a.btn" : "newProject"

  initialize: ->
    @childViews = []
    @listenTo @collection, "reset", @render
    @listenTo App.Vent, "project:create", @addToCollection
    @listenTo @collection, "add", @renderProject
    @collection.fetch({ reset: true })

    @listenTo App.Vent, "remove", @leave

  render: ->
    @$el.html(@template({ authenticated: App.currentUser.get("loggedIn") }))
    @collection.forEach @renderProject, @
    @

  renderProject: (model) ->
    v = new App.Views.Project({ model: model })
    @childViews.push(v)
    @$('ul').append(v.render().el)

  newProject: (e) ->
    e.preventDefault()
    App.Vent.trigger "project:new"

  addToCollection: (model) ->
    @collection.add model
