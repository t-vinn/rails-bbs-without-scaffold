class MyThreadsController < ApplicationController

  def index
    @my_threads = MyThread.all
  end

  def show
  end

  def new
    @my_thread = MyThread.new
  end

  def create
    @my_thread = MyThread.new(params.require(:my_thread).permit(:title))
    if @my_thread.save
      redirect_to @my_thread, notice: 'a new thread created'
    else
      flash.now[:alert] = "no title"
      render :new
    end
  end

  def edit
    @my_thread = MyThread.find(params[:id])
  end

  def update
    @my_thread = MyThread.find(params[:id])
    if @my_thread.update(params.require(:my_thread).permit(:title))
      redirect_to @my_thread, notice: 'the thread name changed'
    else
      flash.now[:alert] = "no title"
      render :edit
    end

  end

  def destroy
    @my_thread = MyThread.find(params[:id])
    @my_thread.destroy
    flash.now[:notice] = "a thread correctly deleted"
  end

end
