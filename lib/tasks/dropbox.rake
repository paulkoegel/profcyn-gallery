# encoding: UTF-8

#require 'dimensions'

namespace :dropbox do

   #- e.g.: rake blood_bank:sync_files['people/michael_bumann.json texts/about_us.json']"

  # assumed folder structure:
  # - galleries (not checked into code repository)
  #   - berlin
  #   - london
  #   - tokyo
  # - repo (code repository from which the rake task is run)
  desc 'Scan local folder for images, calculate their dimensions, upload them to Dropbox and store them in the database.'
  task :sync_up => :environment do
    client = Dropbox::API::Client.new(:token => Settings.dropbox.token, :secret => Settings.dropbox.secret)
    base_path = Dir.pwd.sub(/[a-zA-Z]+$/, 'galleries')

    gallery_folders = Dir["#{base_path}/*"].map{|e| e.split('/').last}
    gallery_folders.each do |gallery_folder|
      gallery = Gallery.find_or_create_by_title(gallery_folder.capitalize)
      Dir["#{base_path}/#{gallery_folder}/*"].each do |image_path|
        file = File.new(image_path)
        server_image_path = '/' + image_path.split('/')[-2..-1].join('/')
        # upload to Dropbox, store image's dropbox URL (either from call back or API call via client.ls('Public') once all images have been uploaded)
        # client.upload file.original_filename, file.tempfile
        Image.create :gallery => gallery, :local_path => server_image_path, :width => Dimensions.width(file), :height => Dimensions.height(file)
        # :url => whatever_dropbox_gives_us
      end
    end
  end

  # TODO: adjust to new model structure - use Gallery instead of Location
  desc 'Query Dropbox API for image paths & store them in the database.'
  task :sync_down => :environment do
    client = Dropbox::API::Client.new(:token => Settings.dropbox.token, :secret => Settings.dropbox.secret)

    client.ls('Public').each do |gallery_folder|
      folder_name = gallery_folder.path.split('/').last
      location = Location.find_or_create_by_country(:country => folder_name)

      gallery_folder.ls.each do |image|
        puts image.path.split('/').last
        Image.create(:location => location,
                     :url => "http://dl.dropbox.com/u/3374145/#{folder_name}/#{image.path.split('/').last}")
      end
    end
  end

end
