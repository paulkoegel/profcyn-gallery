$ ->
  window.Gallery = Backbone.Model.extend()

  window.GalleryView = Backbone.View.extend(
    tagName: 'div'
    className: 'm-gallery'
    initialize: ->
      _.bindAll @, 'render'
      @model.bind 'change', @render
      @template = JST['hello_world']
    render: ->
      $(@el).html(@template @model.toJSON())
      @
  )

  window.gallery = new Gallery({title: 'Thailand', photographer: 'ProfCyn'})
  window.galleryView = new GalleryView({model: gallery})
  $('body').prepend(galleryView.render().el)

  $('.m-gallery').on('click', '.toggler', (event) ->

    event.preventDefault()
    console.log 'clicked da shit'
    console.log window.gallery.get('title')
    if window.gallery.get('title') is 'Thailand'
      window.gallery.set({title: 'No longer Thailand'})
    else
      window.gallery.set({title: 'Thailand'})
  )
