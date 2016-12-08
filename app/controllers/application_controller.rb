class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    @ranch = current_user.ranches.first
    request.env['omniauth.origin'] || ranch_path(@ranch)
  end
end