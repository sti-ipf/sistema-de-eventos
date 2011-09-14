# -*- encoding : utf-8 -*-
class UserSessionsController < ApplicationController
  
  skip_before_filter :require_user, :except => [:destroy]

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = I18n.t('welcome_back')
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find(params[:id])
    @user_session.destroy
    flash[:notice] = I18n.t('logout_message')
    redirect_to sign_in_path
  end
end

