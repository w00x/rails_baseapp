# -*- coding: utf-8 -*-

class SessionsController < ApplicationController
	skip_before_filter :authenticate
	skip_before_filter :permission

	def create
		user = User.authenticate(params[:email], params[:password])
		
		if user and (user.activo == 1 or user.activo == true)
		  session[:user_id] = user.id
		  
		  rol_id = UserRol.find_by_user_id(user.id).rol_id
		  session[:rol] = Rol.find(rol_id).rol
		  
		  flash[:success] = true
		  flash[:notice] = "Sesión iniciada correctamente."
		  redirect_to root_path
		elsif user and user.activo == 0
		  flash[:success] = false
		  flash[:notice] = "Usuario desactivado, comuniquese con los administradores del sistema."
		  render :action => 'new'
		  render :layout => false,:layout => false
		else
		  flash[:success] = false
		  flash[:notice] = "Usuario o contraseña inválidos."
		  render :action => 'new',:layout => false
		end
	end

	def destroy
		flash[:success] = false
		flash[:notice] = "Sesión cerrada correctamente."
		reset_session
		redirect_to login_path
	end

	def new
		render :layout => false
	end
end
