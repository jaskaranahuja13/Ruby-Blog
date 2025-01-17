class RepliesController < ApplicationController
  before_action :set_post
  before_action :set_comment

  def new
    @reply = @comment.replies.build
  end

  def create
    @reply = @comment.replies.build(reply_params)
    @reply.post = @post
    @reply.user = current_user

    if @reply.save
      redirect_to post_path(@post), notice: 'Reply was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @reply = @comment.replies.find(params[:id])
    @reply.destroy
    redirect_to post_path(@post), notice: 'Reply was successfully deleted.'
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:comment_id])
  end

  def reply_params
    params.require(:reply).permit(:body)
  end
end
