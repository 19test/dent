class RubyGettingStarted.Views.PracticeView extends Backbone.View
  template: JST["backbone/templates/practices/practice"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()
    return false

  render: ->
    @$el.html(@template(@model.toJSON()))
    return this
