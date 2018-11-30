class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create!(comment_params)
		redirect_to do |format|
			format.html { redirect_to @post }
			format.js
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:body)
	end
end
