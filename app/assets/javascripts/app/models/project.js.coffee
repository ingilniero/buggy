class App.Models.Project extends Backbone.Model
  urlRoot: "/projects"

  initialize: ->
    @listenTo @, "change:issues", @convertIssues

  convertIssues: ->
    @issues = new App.Collections.Issues(@get('issues'))

class App.Collections.Projects extends Backbone.Collection
  model: App.Models.Project
  url: "/projects"

