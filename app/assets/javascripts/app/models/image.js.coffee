ProfCyn.Image = Ember.Object.extend
  path: null
  width: null
  height: null

  init: ->
    console.log 'initialised image with ' + @get('path') + ' ,' + @get('width') + ', ' + @get('height')
