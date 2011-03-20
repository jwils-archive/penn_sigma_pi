class CommentsController < ApplicationController
	def index
    @comments = Comment.all()

    end
    
    def create
      @comment = Comment.where(:body => params[:body], :post_id => params[:post_id]).first
      if !@comment:
      	@comment = @user.comments.create!(:body => params[:body], :post_id => params[:post_id])
        @post = @comment.post
        @count = @post.comments.count
      	flash[:notice] = "Thanks for commenting!"
      	respond_to do |format|
       	#format.html { redirect_to comments_path }
       	format.js
       end
     else
     	respond_to do |format|
     		format.html
     	end
     end
    end
    
    def destroy
     @comment = Comment.find(params[:id])
     @comment.destroy
     respond_to do |format|
       format.html { redirect_to comments_path }
       format.js
     end
    end
end
