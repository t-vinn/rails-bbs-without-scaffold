class MyThreadsController < ApplicationController

  before_action :set_my_thread, only: [:edit, :update, :destroy]

  def index
    @my_threads = MyThread.all
  end

  def show
  end

  def new
    @my_thread = MyThread.new
  end

  def create
    @my_thread = MyThread.new(my_thread_params)
    if @my_thread.save
      redirect_to "/", :notice =>"a new thread created"
    else
      flash.now[:alert] = "title is too short or the same as another"
      render :new
    end
  end

  def edit
  end

  def update
    if @my_thread.update(my_thread_params)
      redirect_to "/", notice: 'the thread title changed'
    else
      flash.now[:alert] = "title is too short or the same as another"
      render :edit
    end
  end

  def destroy
    if @my_thread.destroy
      redirect_to "/", notice: "the thread correctly deleted"
    else
      flash.now[:notice] = "an error occured and the thread was not deleted"
    end
  end

  private

  def set_my_thread

    @my_thread = MyThread.find(params[:id])
  end

  def my_thread_params
    params.require(:my_thread).permit(:title, :user_id)
  end

end
