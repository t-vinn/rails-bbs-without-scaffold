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

end
