class TasklistsController < ApplicationController

  helper_method :search_term, :sort_column, :sort_direction
  before_action :prepare_tasklist, only: [:show, :destroy, :edit, :update]

  def index
    # byebug
    @tasklists = if params[:sort]
                   Tasklist.all.order(sort_column + ' ' + sort_direction)
                 else
                   Tasklist.search(search_term).order(:name)
                 end
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

  def edit; end

  def update
    if @tasklist.update(tasklist_params)
      flash[:notice] = 'Tasklist updated succesfully'
      redirect_to tasklists_path
    else
      render :edit
    end
  end

  def destroy
    @tasklist.destroy
    flash[:notice] = 'Tasklist deleted succesfully'
    redirect_to tasklists_path
  end

  private

  def tasklist_params
    params.require(:tasklist).permit(:name)
  end

  def prepare_tasklist
    @tasklist = Tasklist.find(params[:id])
  end

  def search_term
    params[:search_term]
  end

  def sort_column
    params[:sort]
  end

  def sort_direction
    params[:direction]
  end

end
