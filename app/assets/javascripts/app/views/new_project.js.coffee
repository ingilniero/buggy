class App.Views.NewProject extends Backbone.View

  template: HandlebarsTemplates['app/templates/new_project']

  events:
    "click button" : "saveProject"

  initialize: ->
    @listenTo @model, "sync", @triggerProjectCreate

  render: ->
    @$el.html(@template())
    @

  saveProject: (e) ->
    e.preventDefault()
    @model.set name: @$('#name').val()
    @model.set description: @$('#description').val()
    @model.save()

  triggerProjectCreate: ->
    App.Vent.trigger "project:create", @model
