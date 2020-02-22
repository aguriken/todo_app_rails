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
      flash[:success] = 'タスクを作成しました'
      redirect_to "/projects/#{@project.id}/tasks"
    else
      flash.now[:danger] = 'タスクを作成に失敗しました。'
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
    redirect_to "/projects/#{@project.id}/tasks"
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    slacknotifier(task, params[:action])
    flash[:success] = 'タスクを削除しました。'
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
