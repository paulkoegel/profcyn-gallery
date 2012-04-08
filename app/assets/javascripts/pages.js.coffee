$ ->
  _.times ProfCyn.image_files.length, (counter) ->
    $('.gallery').append('<img src="" height="' + ProfCyn.image_files[counter].height + '">')

  _.each ProfCyn.image_files[0...10], (file, index) ->
    $('.gallery img').eq(index).attr('src', '/assets/' + file.file).attr('height',file.height)

