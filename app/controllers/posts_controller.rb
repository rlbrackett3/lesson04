class PostsController < ApplicationController
	def index
		# for a nested resource the controller will look a bit different since you will have to find the user and then the posts
		@posts = Post.all
	  if @posts.count 
	     flash[:notice] = "Posts display successfully."
	  else
	    flash[:alert] = "Sorry, there were no posts to
	    display."
      end 
	end

	
	def create
		@post = Post.new(posts_params)
		@post.save
		redirect_to post_path(@post)
	end

	def show
        @post = Post.find(params[:id])
	end

	def destroy
        @post = Post.find(params[:id])
        if @post.destroy
        	flash[:notice] = "Post deleted!!"
        else
        	flash[:alert] = "There was a problem deleting the post."
        end
        redirect_to posts_path
    end

	private

	def posts_params
        params.require(:post).permit(:title, :text)
    end

end
