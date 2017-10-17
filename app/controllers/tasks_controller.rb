class TasksController < ApplicationController

before_action :prepare_task

  def index
    @task = Task.all
  end

  def new
  end

  def create
    @task = @tasklist.tasks.new(task_params)
    if @task.save
      redirect_to tasklist_task_index_path(@tasklist)
    else
      render :new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasklist_task_index_path(:tasklist_id)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to task_path(params[:book_id])
  end

private

  def task_params
    params.require(:task).permit(:name, :due_date, :status)
  end

  def prepare_task
    @tasklist = Tasklist.find(params[:tasklist_id])
  end

end
