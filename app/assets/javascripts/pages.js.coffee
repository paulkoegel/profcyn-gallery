$ ->

  _.times ProfCyn.image_files.length, (counter) ->
    $('.gallery').append('<img src="" height="' + ProfCyn.image_files[counter].height + '" data-counter="' + counter + '">')
    if (counter+1) % 10 == 0
      $('<div class="trigger" data-counter="' + counter + '"></div>').insertAfter $('.gallery img').eq(counter)

  _.each ProfCyn.image_files[0...10], (file, index) ->
    $('.gallery img').eq(index).attr('src', '/assets/' + file.file).attr('height',file.height)

  $(document).scroll ->
    if $('.trigger:in-viewport').length and $('.trigger:in-viewport').last().next('img').attr('src') == ''
      next_image_index = $('.trigger:in-viewport').last().data('counter') + 1
      console.log next_image_index
      # TODO: replace with loadImages
      _.each ProfCyn.image_files[next_image_index...next_image_index+10], (file, index) ->
        $('.gallery img').eq(next_image_index + index).attr('src', '/assets/' + file.file).attr('height',file.height)
