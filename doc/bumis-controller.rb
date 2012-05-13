class PhotosController < ApplicationController
  
  caches_page :show, :thumbnail
  
  def show
    @photo = DROPBOX.ls("Brunorunde/#{params[:path]}").first
    @photo.id = @photo.path.gsub(/brunorunde\//i,"")
    @photo.name = @photo.id.humanize
  end
  
  def thumbnail
    @file = DROPBOX.ls("Brunorunde/#{params[:path]}").first
    send_data @file.thumbnail(:size => (params[:size] || "m")), :type => "image/jpeg", :disposition => 'inline'
  end

end
[24/04/2012 18:53:26] Bumi: class FoldersController < ApplicationController

  caches_page :index
  
  def index
    metadata_files = DROPBOX.search "info.txt", :path => "Brunorunde" 
    @metadata = {}
    metadata_files.each do |file|
      begin 
        @metadata[file.path.gsub(/\/info.txt/i,"").downcase] = YAML.load(file.download)
      rescue
        Rails.logger.error("Broken yml file: #{file.path}")
        # just ignore broken files
      end
    end
    @folders = DROPBOX.ls "Brunorunde"
    @folders.reject! {|f| !f.is_dir }
    @folders.each do |folder|
      folder.id = folder.path.gsub(/brunorunde\//i,"")
      folder.name = @metadata[folder.path.downcase]["name"] || folder.id.humanize  
      folder.date = @metadata[folder.path.downcase]["datum"] || Date.parse("2003-01-01")
    end
    @folders.sort! {|a,b| b.date <=> a.date }
    
  end
  
  def show
    @photos = DROPBOX.ls "Brunorunde/#{params[:id]}"
    @photos.each do |photo|
      photo.id = photo.path.gsub(/brunorunde\//i,"")
      photo.name = photo.id.humanize
    end
  end
end
