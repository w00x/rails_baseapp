# -*- coding: utf-8 -*-

class ApplicationController < ActionController::Base
	before_filter :authenticate
	before_filter :permission

	include Acl
	protect_from_forgery

	protected 
	# Returns the currently logged in user or nil if there isn't one
	def current_user
	  return unless session[:user_id]
	  @current_user ||= User.find_by_id(session[:user_id]) 
	end

	# Make current_user available in templates as a helper
	helper_method :current_user

	# Filter method to enforce a login requirement
	# Apply as a before_filter on any controller you want to protect
	def authenticate
	  logged_in? ? true : access_denied
	end

	# Predicate method to test for a logged in user    
	def logged_in?
	  current_user.is_a? User
	end

	def permission
	  has_permission? ? true : access_denied_no_permission
	end

	def has_permission?
	  is_allow(session[:rol],self.controller_name,self.action_name)
	end

	# Make logged_in? available in templates as a helper
	helper_method :logged_in?

	def access_denied_no_permission
	  redirect_to login_path, :notice => "Esta entrando en area restringida" and return false
	end

	def access_denied
	  redirect_to login_path, :notice => "Por favor, inicie sesión para continuar" and return false
	end
end
