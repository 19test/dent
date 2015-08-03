class Dent.Views.PracticesEditView extends Backbone.View
  el: '#practices'

  template: JST["backbone/templates/practices/edit"]

  events:
    "submit #edit-practice": "update"

  initialize: ->
    @render()

  render: ->
    @$el.html @template(@model.toJSON())
    @

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()
    name = $('#name').val()
    address = $('#address').val()
    city = $('#city').val()
    province  = $('#province').val()
    postal_code = $('#postal_code').val()
    phone_number = $('#phone_number').val()
    bio = $('#bio').val()
    @model.save {name: name, address: address, city: city, province: province, postal_code: postal_code, phone_number: phone_number, bio: bio},
      success: (practice) =>
        @model = practice
        window.location.hash = "/#{@model.id}"
