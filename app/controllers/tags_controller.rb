class TagsController < ApplicationController

	def index
		@tags = Tag.all
	end

	def show
		@tag = Tag.find(params[:id])
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy

		redirect_to tags_path
	end
# before_action(it's preffered because do something before the action takes place) is same as before_filter 
	before_action :require_login, only: [:destroy]

	def require_login
		unless Author.count == 0 || current_user
			redirect_to root_path
			return false
		end
	end
end
