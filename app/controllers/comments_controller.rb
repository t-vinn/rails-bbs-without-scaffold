class CommentsController < ApplicationController
  before_action :set_comment, only:[:edit, :update, :destroy]
  before_action :set_my_thread, only:[:edit, :update, :index, :new, :create, :destroy]


  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to action: 'index' 
      flash.now[:alert] = "a new comment posted"
    else
      flash.now[:alert] = "the message is too short"
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to action: 'index' 
      flash.now[:alert] = "the comment revised"
    else
      flash.now[:alert] = "the message is too short"
      render :edit
    end

  end

  def destroy
    if @comment.destroy
      redirect_to my_thread_comments_path(@my_thread),notice: "the comment correctly deleted"
    else
      flash.now[:notice] = "an error occured and the comment was not deleted"
    end
    
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_my_thread
      @my_thread = MyThread.find(params[:my_thread_id])
    end

    def comment_params
      params.require(:comment).permit(:message, :user_id, :my_thread_id)
    end
end
