class Api::ToolsController < ApplicationController
	def index
		render json: Tool.all
	end
end