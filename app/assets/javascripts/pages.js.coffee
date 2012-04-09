$ ->

  _.times ProfCyn.image_files.length, (counter) ->
    $('.gallery').append('<img src="" height="' + Math.floor(ProfCyn.image_files[counter].height * 0.68) + '" width="' + Math.floor(ProfCyn.image_files[counter].width * 0.68) + '" data-counter="' + counter + '">')
    if (counter+1) % Math.floor(ProfCyn.preloadCount/2) == 0
      $('<div class="trigger" data-preload-index="' + (counter+1) + '"></div>').insertAfter $('.gallery img').eq(counter)

  preloadedUpTo = $.cookie('preloadedUpTo')
  if preloadedUpTo
    _.times (Math.floor(preloadedUpTo / ProfCyn.preloadCount) + 1), (counter) ->
      ProfCyn.preloadImages counter * ProfCyn.preloadCount
  else
    ProfCyn.preloadImages 0

  $(document).scroll ->
    if $('.trigger:in-viewport').length and $('.trigger:in-viewport').next('.trigger').next('img').attr('src') == ''
      console.log 'scroll trigger'
      nextImageIndex = $('.trigger:in-viewport').last().data('preload-index') + 5
      console.log nextImageIndex
      $.cookie('preloadedUpTo', nextImageIndex)
      ProfCyn.preloadImages nextImageIndex
