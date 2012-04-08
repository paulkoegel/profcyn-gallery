require 'json'
require 'dimensions'

File.open('app/assets/javascripts/image_files.js.coffee', 'w+') do |file|
  file_list = Dir['app/assets/images/*/**']
  file_list.delete_if {|file_name| file_name !~ /\.(png|jpg|jpeg|gif)$/}
  #file_list.map! {|file| file.gsub('app/assets/images/', '') }
  file_list.map! do |file|
    {:file => file.gsub('app/assets/images/', ''), :width => Dimensions.width(file), :height => Dimensions.height(file)}
  end
  file.write "ProfCyn.image_files =\n" + file_list.to_json.gsub(',"', ', "').gsub('},', "},\n")
end
