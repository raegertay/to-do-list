class TasklistsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @tasklist = Tasklist.new
  end

  def create
    @tasklist = Tasklist.new(tasklist_params)
    if @tasklist.save
      flash[:notice] = 'Tasklist created successfully'
      redirect_to tasklist_path(@tasklist)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def tasklist_params
    params.require(:tasklist).permit(:name)
  end

end
