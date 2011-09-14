# -*- encoding : utf-8 -*-
class UsersController < ApplicationController

  skip_before_filter :require_user, :only=>[:sign_up, :create]

  def sign_up
    @user ||= User.new
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
    render :layout => false if request.xhr?
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        flash[:notice] = I18n.t('user.created')
        format.js if request.xhr?
        if current_user.created_at > DateTime.now - 2.minute
          format.html { redirect_to( root_path ) }
        else
          format.html { redirect_to( users_path ) }
        end        
      else
        format.js if request.xhr?
        format.html { render :action => "new" }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
    render :layout => false if request.xhr?
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = I18n.t('user.updated')
        if @user.id == current_user.id
          format.html { redirect_to(root_path) }
        else
          format.js if request.xhr?
          format.html { redirect_to(users_path) }
        end
      else
        format.js if request.xhr?
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = I18n.t('user.deleted')
    redirect_to users_path
  end

  def save
    @user = User.new(params[:user])
    @user.save
  end


end

