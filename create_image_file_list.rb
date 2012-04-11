require 'json'
require 'dimensions'

File.open('image_file_list.json', 'w+') do |file|
  file_list = Dir['app/assets/images/*/**']
  file_list.delete_if {|file_name| file_name !~ /\.(png|jpg|jpeg|gif)$/}
  file_list.map! {|file|
                   { :path   => file.gsub('app/assets/images/', ''),
                     :width  => Dimensions.width(file),
                     :height => Dimensions.height(file) }
                 }
  file.write file_list.to_json.gsub(',"', ', "').gsub('},', "},\n")
end
