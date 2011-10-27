class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user_session, :current_user
  before_filter :require_user
  before_filter :set_locale

private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def require_user
    if !current_user
      flash[:notice] = I18n.t('user_session.only_logged')
      session[:return_to] = request.request_uri
      redirect_to sign_in_path
      return false
    end
  end


  def set_locale
    I18n.locale = 'pt'
  end
  
end
