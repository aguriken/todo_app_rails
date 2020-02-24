class TasksController < ApplicationController
  include SlackNotifier
  before_action :find_project
  def index 
    @tasks = @project.tasks
  end

  def new
  end

  def create
    task = @project.tasks.build(task_params)
    if task.save
      slacknotifier(task, params[:action])
      flash[:success] = 'Well Done! You successfully created new task'
      redirect_to "/projects/#{@project.id}/tasks"
    else
      flash.now[:danger] = 'Error... Something went wrong'
      redirect_to "/projects/#{@project.id}/tasks"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    slacknotifier(task, params[:action])
    flash[:success] = 'Well Done! You successfully updated new task'
    redirect_to "/projects/#{@project.id}/tasks"
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    slacknotifier(task, params[:action])
    flash[:success] = 'Well done. Task was deleted'
    redirect_to "/projects/#{@project.id}/tasks"
  end 

  private

  def task_params
    params.require(:task).permit(:title, :deadline, :description)
  end

  def find_project
    @project = Project.find(params[:project_id])
  end
end
