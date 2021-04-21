class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken 
  protect_from_forgery unless: -> { request.format.json? }
  before_action :authenticate_api_v1_user!
end
