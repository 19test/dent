class RubyGettingStarted.Routers.PracticesRouter extends Backbone.Router

  initialize: (options) ->
    @practices = new RubyGettingStarted.Collections.PracticesCollection()
    @practices.reset options.practices

  routes:
    "index"       : "index"
    "new"         : "newPractice"
    ":id"         : "show"
    ":id/edit"    : "edit"
    ".*"          : "index"

  index: ->
    @view = new RubyGettingStarted.Views.PracticesIndexView({collection: @practices})

  newPractice: ->
    @view = new RubyGettingStarted.Views.PracticesNewView({collection: @practices})

  show: (id) ->
    practice = @practices.get(id)
    @view = new RubyGettingStarted.Views.PracticesShowView({model: practices})

  edit: (id) ->
    practice = @practices.get(id)
    @view = new RubyGettingStarted.Views.PracticesEditView({model: practices})