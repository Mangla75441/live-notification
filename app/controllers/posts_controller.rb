class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		
	end

	def new
		@post = Post.new
	end

	def edit
		@post=Post.find(params[:id])
		
	end

	def create
		# @post = Post.new(posts_params.merge(user_id: current_user.id))
		@post = current_user.posts.build(posts_params)
		if @post.save
			redirect_to @post
		else
			render 'new'
		end		
	end

	def update
		@post=Post.find(params[:id])
		if @post.update(posts_params)
			redirect_to @post
		else
			render 'edit'
		end				
	end

	def destroy
		@post=Post.find(params[:id])
		@post.destroy

		redirect_to articles_path
		
	end
	private
		def posts_params
			params.require("post").permit(:content,:user_id)
			
		end

end
