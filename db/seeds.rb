require 'dimensions'

file_names = Dir['app/assets/images/*/**'].delete_if{|file_name| file_name !~ /\.(png|jpg|jpeg|gif)$/}
file_names.each do |file_name|
  Image.create(
    :path   => file_name.gsub('app/assets/images/', ''),
    :width  => Dimensions.width(file_name),
    :height => Dimensions.height(file_name)
  )
end
