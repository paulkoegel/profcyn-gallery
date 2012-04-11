# encoding: UTF-8

namespace :images do

 desc 'Store updated list of images in the DB.'
 task :update => :environment do

    file_list = Dir['app/assets/images/**/*']
    file_list.delete_if {|file_name| file_name !~ /\.(png|jpg|jpeg|gif)$/}
    file_list.map! {|file| { :path   => file.gsub('app/assets/images/', ''),
                             :width  => Dimensions.width(file),
                             :height => Dimensions.height(file) } }
    
    file_list.each { |file| Image.create(file) }
 end

end
