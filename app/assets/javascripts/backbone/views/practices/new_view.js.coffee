class Dent.Views.PracticesNewView extends Backbone.View
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
    city = $('#city').val()
    province  = $('#province').val()
    postal_code = $('#postal_code').val()
    phone_number = $('#phone_number').val()
    bio = $('#bio').val()
    model = new Dent.Models.Practice({name: name, address: address, city: city, province: province, postal_code: postal_code, phone_number: phone_number, bio: bio})
    @collection.create model,
      success: (practice) =>
        @model = practice
        window.location.hash = "/#{@model.id}"
