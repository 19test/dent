class RubyGettingStarted.Views.PracticesNewView extends Backbone.View
  el: '#practices'

  template: JST["backbone/templates/practices/new"]

  events:
    "submit #new-practice": "save"

  initialize: ->
    @render()

  render: ->
    @$el.html @template()

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
    name = $('#name').val()
    address = $('#address').val()
    model = new RubyGettingStarted.Models.Practice({name: name, address: address})
    @collection.create model,
      success: (practice) =>
        @model = practice
        window.location.hash = "/#{@model.id}"
