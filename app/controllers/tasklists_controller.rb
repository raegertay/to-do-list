class TasklistsController < ApplicationController

  before_action :prepare_tasklist, only: [:show]

  def index
    @tasklists = Tasklist.all.order(:name)
    flash[:alert] = 'No task list found' if @tasklists.empty?
  end

  def show
    @tasks = @tasklist.tasks
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

  def prepare_tasklist
    @tasklist = Tasklist.find(params[:id])
  end

end
