module Api
	module V1

		class ArticlesController < ApplicationController
		# load_and_authorize_resource
		skip_before_action :verify_authenticity_token
		#this line
		respond_to :json
		# before_action :authenticate_user!, except: [:index, :show]
		def index
		     articles = Article.all
			 render json: articles
		  end


			def show
				article = Article.find(params[:id])
				render json: article
		    	#@article = Article.find(params[:id])
		    	# respond_to do |format|
			    #   format.html
			    #   format.json { render json: @article }
			   # end
		  	end

			def new
				@article = Article.new
			end

			def edit 
				@article = Article.find(params[:id])
			end

			def create
				@article = Article.new(article_params)
				# @article.user = current_user
			 	if @article.save
			  		render json: @article
			  	else
			  		render json: { errors: @article.errors }
			  	end
			end

			def update
		  		@article = Article.find(params[:id])
		 
		 	 	if @article.update(article_params)
		    		render json: @article
		  		else
		  			render json: { errors: @article.errors }
		    	end

		    end

		    def destroy
		    	@article = Article.find(params[:id])
		    	@article.destroy
		    	# head 204
		    	
		    end
		  
			private
			  	def article_params
				    params.require(:article).permit(:title, :text)
				end

		end
	end
end