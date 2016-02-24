class TooltypesController < ApplicationController

	def show
		@tooltype = Tooltype.find_by_id(params[:id])
		@tools = @tooltype.tools.paginate(page: params[:page], per_page: 2)
	end
end
