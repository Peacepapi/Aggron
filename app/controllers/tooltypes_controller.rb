class TooltypesController < ApplicationController

	def show
		@tooltype = Tooltype.find_by_id(params[:id])
		@tooltypes = Tooltype.all
		@tools = @tooltype.tools.paginate(page: params[:page], per_page: 4)
	end
end
