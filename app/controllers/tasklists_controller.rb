class TasklistsController < ApplicationController

  helper_method :search_term, :sort_column, :sort_direction, :prepare_page
  before_action :prepare_tasklist, only: [:show, :destroy, :edit, :update]
  before_action :prepare_page, only: [:index]
  before_action :login_check

  TASKLIST_PER_PAGE = 10

  def index
    # byebug
    @tasklists = current_user.tasklists.search(search_term).order(sort_column + ' ' + sort_direction)
    @total_pages = count_total_pages(@tasklists.count, TASKLIST_PER_PAGE)
    @tasklists = @tasklists.paginate(TASKLIST_PER_PAGE, @page)
    flash[:alert] = 'No task list found' if @tasklists.empty?
  end

  def show
    @tasks = @tasklist.tasks.search(search_term).order(sort_column + ' ' + sort_direction)
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
    if Tasklist.column_names.include?(params[:sort]) || Task.column_names.include?(params[:sort])
      params[:sort]
    else
       'name'
    end
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def prepare_page
    @page = params[:page] || 1
    @page = @page.to_i
  end

  def count_total_pages(total_records, record_per_page)
    (total_records / record_per_page) + 1
  end

end
