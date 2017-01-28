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
      redirect_to @my_thread, notice: 'a new thread created'
    else
      flash.now[:alert] = "no title"
      render :new
    end
  end

  def edit
  end

  def update
    if @my_thread.update(my_thread_params)
      redirect_to @my_thread, notice: 'the thread name changed'
    else
      flash.now[:alert] = "no title"
      render :edit
    end
  end

  def destroy
    @my_thread.destroy
    flash.now[:notice] = "a thread correctly deleted"
  end

  private

  def set_my_thread
    @my_thread = MyThread.find(params[:id])
  end

  def my_thread_params
    params.require(:my_thread).permit(:title)
  end

end
