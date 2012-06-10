window.ProfCyn = new Object

$ ->

  window.Gallery = Backbone.Model.extend()

  window.GalleryView = Backbone.View.extend(
    tagName: 'div'
    className: 'm-gallery'
    initialize: ->
      _.bindAll @, 'render'
      @model.bind 'change', @render
      @template = JST['galleries/show']
    render: ->
      $(@el).html(@template @model.toJSON())
      @
  )

  window.gallery = new Gallery(gon.gallery)
  window.galleryView = new GalleryView({model: gallery})
  $('.m-gallery').append(galleryView.render().el)

  # $('.m-gallery').on('click', '.toggler', (event) ->
  #   event.preventDefault()
  #   console.log 'clicked da shit'
  #   console.log window.gallery.get('title')
  #   if window.gallery.get('title') is 'Taiwan'
  #     window.gallery.set({title: 'No longer Taiwan'})
  #   else
  #     window.gallery.set({title: 'Taiwan'})
  # )
