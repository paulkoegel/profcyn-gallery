# encoding: UTF-8

namespace :images do

  desc 'Query Dropbox API for image paths & store them on the DB.'
  task :update_paths => :environment do
    client = Dropbox::API::Client.new(:token => Settings.dropbox.token, :secret => Settings.dropbox.secret)
    #puts client.ls[0].ls.map(&:direct_url)
  end

end
