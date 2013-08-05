class App.Views.Content extends Backbone.View

  className: 'row'

  template: HandlebarsTemplates['app/templates/content']

  initialize: ->
    @listenTo App.Vent, "project:create", @swapMainEmpty
    @listenTo App.Vent, "project:new", @swapMainToNewProject

  render: ->
    @$el.html(@template())
    @

  swapMain: (v) ->
    @changeCurrentMainView(v)
    @$('#main-area').html(@currentMainView.render().el)

  changeCurrentMainView: (v) ->
    @currentMainView.remove() if @currentMainView
    @currentMainView = v

  swapSide: (v) ->
    @changeCurrentSideView(v)
    @$('#sidebar-area').html(@currentSideView.render().el)

  changeCurrentSideView: (v) ->
    @currentSideView.remove() if @currentSideView
    @currentSideView = v

  swapMainEmpty: ->
    @swapMain(new App.Views.Empty())
    Backbone.history.navigate("/projects")

  swapMainToNewProject: ->
    @swapMain(new App.Views.NewProject({ model: new App.Models.Project }))
    Backbone.history.navigate("/projects/new")
