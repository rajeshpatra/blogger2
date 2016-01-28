class CommentsController < ApplicationController


	include CommentsHelper

	def create
		@comment = Comment.new(comment_params)
		@comment.article_id = params[:article_id]
		
		@comment.save

		redirect_to article_path(@comment.article)
	end

# requires login except create method by anyone, if anyone wants to delete comment, it will ask for login.
	before_filter :require_login, except: [:create]

	def require_login
		unless Author.count == 0 || current_user
			rdirect_to root_path
			return false
		end
	end

end
