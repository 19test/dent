class Dent.Views.PracticesIndexView extends Backbone.View

  el: '#practices'

  template: JST["backbone/templates/practices/index"]

  initialize: ->
    @render()
    @addAll()

  addAll: ->
    @collection.forEach(@addOne, @)

  addOne: (model) ->
    @view = new Dent.Views.PracticeView({model: model})
    @$el.find('tbody').append @view.render().el

  render: ->
    @$el.html @template()
    @
