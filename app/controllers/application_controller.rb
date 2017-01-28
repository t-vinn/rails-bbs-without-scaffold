class ApplicationController < ActionController::Base


  protect_from_forgery with: :exception

  before_action :authenticate_user!

#
#  def authenticate_user!
#    p "hoge"
#    super
#    p current_user
#  end
end
