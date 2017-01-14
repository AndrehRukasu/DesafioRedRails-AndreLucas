# This file is used by Rack-based servers to start the application.
#necessario no windows
require 'tzinfo'
require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
