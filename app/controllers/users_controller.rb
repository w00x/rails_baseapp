# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  skip_before_filter :authenticate
  skip_before_filter :permission
  
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
    @current_user = User.find_by_id(session[:user_id]) 
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
 puts "----------"
    require 'pp'
    pp params
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user.id), :notice => 'Usuario actualizado satisfactoriamente.'
    else
      render :action => 'edit'
    end
  end
end