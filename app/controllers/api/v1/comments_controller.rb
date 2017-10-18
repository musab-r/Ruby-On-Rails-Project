module Api
	module V1

		class CommentsController < ApplicationController
			# http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
			skip_before_action :verify_authenticity_token
			respond_to :json



		def create
			@article = Article.find(params[:article_id])
			@comment = @article.comments.create(comment_params)
			# redirect_to article_path(@article)
				if @article.save
		    		render json: @article, status: 200
		  		else
		  			render json: { errors: @article.errors }
		    	end

		end
		def destroy
		    @article = Article.find(params[:article_id])
		    @comment = @article.comments.find(params[:id])
		    @comment.destroy
		    # redirect_to article_path(@article)
		    head (:ok)
		     
		    puts "deleted"

		  end
		private
			def comment_params
				params.require(:comment).permit(:commenter, :body)
			end
		end
	end
end
