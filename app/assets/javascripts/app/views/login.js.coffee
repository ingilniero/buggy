class App.Views.Login extends Backbone.View

  template: HandlebarsTemplates['app/templates/login']

  events:
    "click button" : "login"

  initialize: ->
    @listenTo @model, "error", @renderError
    @listenTo @model, "sync", @triggerLoggedIn

  render: ->
    @$el.html(@template())
    @

  login: (e) ->
    e.preventDefault()
    @model.set username: @$('#username').val()
    @model.set password: @$('#password').val()
    @model.save()

  renderError: ->
    @$('.alert').html("Credentials are not valid").show()

  triggerLoggedIn: ->
    App.Vent.trigger "user:logged_in", @model.get('id'), @model.get('username')
