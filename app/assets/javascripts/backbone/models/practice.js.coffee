class RubyGettingStarted.Models.Practice extends Backbone.Model
  paramRoot: 'practice'

class RubyGettingStarted.Collections.PracticesCollection extends Backbone.Collection
  model: RubyGettingStarted.Models.Practice
  url: '/practices'
