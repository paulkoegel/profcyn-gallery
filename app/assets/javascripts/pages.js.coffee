$ ->
  console.log 'document ready'
  _.times ProfCyn.image_files.length, (counter) ->
    $('.gallery').append('<img src="" height="616">')

  _.each ProfCyn.image_files[0..10], (file, index) ->
    $('.gallery img').eq(index).attr('src', '/assets/' + file).attr('height','auto')

