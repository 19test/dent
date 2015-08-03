class Dent.Routers.PracticesRouter extends Backbone.Router

  initialize: (options) ->
    @practices = new Dent.Collections.PracticesCollection()
    @practices.reset options.practices

  routes:
    "index"       : "index"
    "new"         : "newPractice"
    ":id"         : "show"
    ":id/edit"    : "edit"
    ".*"          : "index"

  index: ->
    @view = new Dent.Views.PracticesIndexView({collection: @practices})

  newPractice: ->
    @view = new Dent.Views.PracticesNewView({collection: @practices})

  show: (id) ->
    practice = @practices.get(id)
    @view = new Dent.Views.PracticesShowView({model: practices})

  edit: (id) ->
    practice = @practices.get(id)
    @view = new Dent.Views.PracticesEditView({model: practices})