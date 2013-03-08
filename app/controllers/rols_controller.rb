# -*- coding: utf-8 -*-
class RolsController < ApplicationController
  before_filter [:authenticate,:permission]
  # GET /rols
  # GET /rols.json
  def index
    @menu_roles = "class='active'"
    @rols = Rol.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rols }
    end
  end

  # GET /rols/1
  # GET /rols/1.json
  def show
    @menu_roles = "class='active'"
    @rol = Rol.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rol }
    end
  end

  # GET /rols/new
  # GET /rols/new.json
  def new
    @menu_roles = "class='active'"
    @rol = Rol.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rol }
    end
  end

  # GET /rols/1/edit
  def edit
    @menu_roles = "class='active'"
    @rol = Rol.find(params[:id])
  end

  # POST /rols
  # POST /rols.json
  def create
    @menu_roles = "class='active'"
    @rol = Rol.new(params[:rol])

    respond_to do |format|
      if @rol.save
        format.html { redirect_to @rol, notice: 'Rol fue satisfactoriamente creado.' }
        format.json { render json: @rol, status: :created, location: @rol }
      else
        format.html { render action: "new" }
        format.json { render json: @rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rols/1
  # PUT /rols/1.json
  def update
    @menu_roles = "class='active'"
    @rol = Rol.find(params[:id])

    respond_to do |format|
      if @rol.update_attributes(params[:rol])
        format.html { redirect_to @rol, notice: 'Rol fue satisfactoriamente actualizado.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rols/1
  # DELETE /rols/1.json
  def destroy
    @menu_roles = "class='active'"
    @rol = Rol.find(params[:id])
    @rol.destroy

    respond_to do |format|
      format.html { redirect_to rols_url }
      format.json { head :no_content }
    end
  end
end
