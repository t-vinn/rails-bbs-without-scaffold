class CommentsController < ApplicationController
  before_action :set_my_thread, only:[:new, :create]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new

  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to action: 'index', :notice =>"a new comment posted"
    else
      flash.now[:alert] = "the message is too short"
      render :new
    end
  end

  private

    def set_my_thread
      @my_thread = MyThread.find(params[:my_thread_id])
    end

    def comment_params
      params.require(:comment).permit(:message, :user_id, :my_thread_id)
    end
end
