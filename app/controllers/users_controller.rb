# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  skip_before_filter :authenticate, :only => [:new, :create]
  skip_before_filter :permission, :only => [:new, :create]
  
  def new
    @user = User.new

    render :layout => false
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      user_rol = UserRol.new
      user_rol.user_id = @user.id
      user_rol.rol_id = Rol.find_by_rol("usuario").id
      user_rol.save
      
      flash[:success] = true
      flash[:notice] = 'Usuario satisfactoriamente creado.'
      redirect_to login_path
    else
      render :action => 'new',:layout => false
    end
  end
  
  def edit
    @user = User.find(session[:user_id])
  end
  
  def update
    @user = User.find(session[:user_id])

    if @user.update_attributes(params[:user])
      redirect_to edit_user_path, :notice => 'Usuario actualizado satisfactoriamente.'
    else
      render :action => 'edit'
    end
  end
end