class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    # need to redirect it does not do anything on that page
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    # update task already stored in db, access change data to user another than specify below
    # it founds task by id
    @task = Task.find(params[:id])
    # it update by permited actions spec. below
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    # back to home page
    redirect_to tasks_path
  end

  private

  def task_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    # added completed for user when click on checkbox
    params.require(:task).permit(:title, :details, :completed)
  end

end
