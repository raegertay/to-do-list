class TasksController < ApplicationController

  before_action :prepare_tasklist, only: [:create, :new]
  before_action :prepare_task, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def new; end

  def create
    @task = @tasklist.tasks.new(task_params)
    if @task.save
      redirect_to tasklists_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @task.update(task_params)
    redirect_to tasklists_path
  end

  def destroy
    @tasklist = @task.tasklist
    @task.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :due_date, :status)
  end

  def prepare_tasklist
    @tasklist = Tasklist.find(params[:tasklist_id])
  end

  def prepare_task
    @task = Task.find(params[:id])
  end

end
