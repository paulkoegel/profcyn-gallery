$ ->

  _.times ProfCyn.image_files.length, (counter) ->
    $('.gallery').append('<img src="" height="' + ProfCyn.image_files[counter].height + '" width="' + ProfCyn.image_files[counter].width + '" data-counter="' + counter + '">')
    if (counter+1) % Math.floor(ProfCyn.preloadCount/2) == 0
      $('<div class="trigger" data-preload-index="' + (counter+1) + '"></div>').insertAfter $('.gallery img').eq(counter)

  preloadedUpTo = $.cookie('preloadedUpTo')
  if preloadedUpTo
    _.times (Math.floor(preloadedUpTo / ProfCyn.preloadCount) + 1), (counter) ->
      ProfCyn.preloadImages counter * ProfCyn.preloadCount
  else
    ProfCyn.preloadImages 0

  $(document).scroll ->
    if $('.trigger:in-viewport').length and $('.trigger:in-viewport').last().nextAll('.trigger').eq(0).next('img').attr('src') == ''
      nextImageIndex = $('.trigger:in-viewport').last().data('preload-index') + Math.floor(ProfCyn.preloadCount/2)
      $.cookie('preloadedUpTo', nextImageIndex)
      ProfCyn.preloadImages nextImageIndex
