class App.Views.Footer extends Backbone.View

  className: 'row'

  template: HandlebarsTemplates['app/templates/footer']

  render: ->
    @$el.html(@template())
    @
