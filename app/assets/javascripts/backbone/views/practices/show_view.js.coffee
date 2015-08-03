class Dent.Views.PracticesShowView extends Backbone.View

  template: JST["backbone/templates/practices/show"]

  el: '#practices'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template(@model.toJSON()))
    @
