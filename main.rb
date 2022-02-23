     
require 'sinatra'
require 'sinatra/reloader' if development?
require 'bcrypt'

require_relative 'db/db'

require_relative 'models/user'

require_relative 'controllers/users_controller'
require_relative 'controllers/sessions_controller'
require_relative 'controllers/speed_tests_controller'

require_relative 'helpers/session_helper'

enable :sessions





