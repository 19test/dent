class RubyGettingStarted.Views.PracticesEditView extends Backbone.View
  el: '#practices'

  template: JST["backbone/templates/practices/edit"]

  events:
    "submit #edit-practice" : "update"

  initialize: ->
    @render()

  render: ->
    @$el.html @template(@model.toJSON())
    @

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()
    title = $('#name').val()
    content = $('#address').val()
    @model.save {name: name, address: address},
      success: (practice) =>
        @model = practice
        window.location.hash = "/#{@model.id}"
