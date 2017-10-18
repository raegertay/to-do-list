class TasklistsController < ApplicationController

  helper_method :search_term, :sort_column, :sort_direction, :prepare_page
  before_action :prepare_tasklist, only: [:show, :destroy, :edit, :update]
  before_action :prepare_page, only: [:index]

  TASKLIST_PER_PAGE = 10

  def index
    # byebug
    @tasklists = Tasklist.search(search_term).order(sort_column + ' ' + sort_direction)
    @total_pages = @tasklists.count / TASKLIST_PER_PAGE + 1
    @tasklists = @tasklists.limit(TASKLIST_PER_PAGE).offset((@page - 1) * TASKLIST_PER_PAGE)
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
    Tasklist.column_names.include?(params[:sort]) ? params[:sort] : 'name'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def prepare_page
    @page = params[:page] || 1
    @page = @page.to_i
  end

end
