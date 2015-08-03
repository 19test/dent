class Dent.Models.Practice extends Backbone.Model
  paramRoot: 'practice'

class Dent.Collections.PracticesCollection extends Backbone.Collection
  model: Dent.Models.Practice
  url: '/practices'
