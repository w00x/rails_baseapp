# -*- coding: utf-8 -*-
class AsignarRolesController < ApplicationController
	def index
    @menu_asignar = "class='active'"
    @user_rols = UserRol.all
    
    users = User.all
    @users_list = users.map { |user| [user.nombre+" "+user.apellidos, user.id] }
    
    rols = Rol.all
    @rols_list = rols.map { |rol| [rol.rol, rol.id] }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def agregar
    @menu_asignar = "class='active'"
    regla = UserRol.new
    regla.user_id = params[:usuario]
    regla.rol_id = params[:rol]
    
    respond_to do |format|
      if regla.save
        format.html { redirect_to ({:action => "index"}), notice: 'Regla creada satisfactoriamente' }
        format.json { head :no_content }
      else
        format.html { render action: "index" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @menu_asignar = "class='active'"
    rol = UserRol.find(params[:id])
    rol.destroy

    respond_to do |format|
      format.html { redirect_to ({:action => "index"}) }
      format.json { head :no_content }
    end
  end
end
