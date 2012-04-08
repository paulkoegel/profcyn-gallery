ProfCyn.preloadImages = (startIndex) ->
  console.log 'preloading images from ' + startIndex + ' to ' + (startIndex + ProfCyn.preloadCount)
  _.each ProfCyn.image_files[startIndex...startIndex + ProfCyn.preloadCount], (file, counter) ->
    imageIndex = startIndex + counter
    $('.gallery img').eq(imageIndex).attr('src', '/assets/' + file.path)
      .attr('height', Math.floor(ProfCyn.image_files[imageIndex].height * 0.68))
      .attr('width', Math.floor(ProfCyn.image_files[imageIndex].width * 0.68))
