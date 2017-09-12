class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, if: ->{request.format.json?}

  add_flash_types :success, :danger, :info, :warning
end
