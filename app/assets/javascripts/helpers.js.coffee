# ProfCyn.preloadImages = (startIndex) ->
#   _.each ProfCyn.image_files[startIndex...startIndex + ProfCyn.preloadCount], (file, counter) ->
#     imageIndex = startIndex + counter
#     $('.gallery img').eq(imageIndex).attr('src', '/assets/' + file.path)
#       .attr('height', ProfCyn.image_files[imageIndex].height)
#       .attr('width', ProfCyn.image_files[imageIndex].width)
