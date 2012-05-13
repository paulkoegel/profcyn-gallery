$ ->
  window.Gallery = Backbone.Model.extend()

  window.GalleryView = Backbone.View.extend(
    initialize: ->
      @template = JST['hello_world']
    render: ->
      $(@el).html(@template @model.toJSON())
      @
  )

  window.gallery = new Gallery({title: 'Thailand', photographer: 'ProfCyn'})
  window.galleryView = new GalleryView({model: gallery})
  $('body').append(galleryView.render().el)
