class ApplicationController < ActionController::Base

  protect_from_forgery
  http_basic_authenticate_with :name => Settings.htaccess.user, :password => Settings.htaccess.password unless Rails.env.development? || Rails.env.test?

  private
    def init_dropbox_client
      @client = Dropbox::API::Client.new(:token => Settings.dropbox.token, :secret => Settings.dropbox.secret)
    end

end
