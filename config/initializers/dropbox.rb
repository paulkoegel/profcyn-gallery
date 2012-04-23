require 'dropbox-api'

Dropbox::API::Config.app_key    = Settings.dropbox.app_key
Dropbox::API::Config.app_secret = Settings.dropbox.app_secret
Dropbox::API::Config.mode       = 'sandbox' # or 'dropbox' if your app may access your entire dropbox
