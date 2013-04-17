# -*- coding: utf-8 -*-
class AdminUserController < ApplicationController
	def index
    @menu_usuarios = "class='active'"
    @users = User.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    @menu_usuarios = "class='active'"
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def new
    @menu_usuarios = "class='active'"
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def edit
    @menu_usuarios = "class='active'"
    @user =User.find(params[:id])
  end

  def create
    @menu_usuarios = "class='active'"
    @user = User.new
    @user.nombre = params[:nombre]
    @user.apellidos = params[:apellidos]
    @user.activo = params[:activo] == ""?true:false
    
    if params[:hashed_password_one] == params[:hashed_password_two]
      if params[:hashed_password_one] != "" and params[:hashed_password_two] != ""
        @user.hashed_password = Digest::SHA1.hexdigest(params[:hashed_password_one])
      end
      
      respond_to do |format|
        if @user.save()
          format.html { redirect_to ({:action => "show", :id => @user.id}), notice: 'Usuario creado satisfactoriamente' }
          format.json { head :no_content }
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
        respond_to do |format|
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
    end
  end

  def update
    @menu_usuarios = "class='active'"
    @user = User.find(params[:id])
    @user.nombre = params[:nombre]
    @user.apellidos = params[:apellidos]
    @user.activo = params[:activo] == ""?true:false
    
    if params[:hashed_password_one] == params[:hashed_password_two]
      if params[:hashed_password_one] != "" and params[:hashed_password_two] != ""
        @user.hashed_password = Digest::SHA1.hexdigest(params[:hashed_password_one])
      end
      
      respond_to do |format|
        if @user.save()
          
          format.html { redirect_to ({:action => "show", :id => @user.id}), notice: 'Usuario actualizado satisfactoriamente' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
        respond_to do |format|
          format.html { render action: "edit" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
    end
  end

  def destroy
    @menu_usuarios = "class='active'"
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to ({:action => "index"}), notice: 'Usuario eliminado satisfactoriamente'  }
      format.json { head :no_content }
    end
  end
end
