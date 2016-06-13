class PostsController < ApplicationController
	def index
		@pageSize = 5
		@postTotal = Post.count
		@pageCount =  (@postTotal / @pageSize).to_i
		@pageCount += @postTotal % @pageSize == 0 ? 0 : 1
		index = params[:page] == nil ? 1 : params[:page]
		@i = index.to_i - 1
  		@posts = Post.limit(@pageSize).offset(@i*@pageSize)
  	end

	def show
	end

	def new
	end

	def create
		@post = Post.new Title: params[:Title],
 						 Content: params[:Content]
		if @post.save
			redirect_to action: 'index'
		else
			render :new
		end
	end

	def new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update post_params
			redirect_to action: 'index'
		else
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to action: 'index'
	end

	def post_params
  		params.require(:post).permit(:Title, :Content)
	end
end

