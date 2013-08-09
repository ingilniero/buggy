class App.Views.Project extends Backbone.View

  template: HandlebarsTemplates['app/templates/project']

  initialize: ->
    @listenTo @model, "destroy", @remove
    @listenTo @model, "change:name", @render
    @listenTo App.Vent, 'test', @log
    @listenTo App.Vent, 'issues:change', @updateCounter

  log: ->
    console.log 'test'

  events:
    "click a" : "showDetails"

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

  showDetails: (e) ->
    e.preventDefault()
    App.Vent.trigger "project:show", @model
    Backbone.history.navigate "/projects/" + @model.id

  updateCounter: (model, count) ->
    if model.get('project_id') is @model.id
      @$('span.badge').text(count)
