# encoding: UTF-8

namespace :dropbox do

  desc 'Query Dropbox API for image paths & store them in the DB.'
  task :sync => :environment do
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
