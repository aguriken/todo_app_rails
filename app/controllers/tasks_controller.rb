class TasksController < ApplicationController
  before_action :find_task
  def index 
    @tasks = @project.tasks
  end

  def new
  end

  def create
    @task = @project.tasks.build(task_params)
    if @task.save
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
    project = Project.find(params[:project_id]) 
    Task.find(params[:id]).update(task_params)
    redirect_to "/projects/#{project.id}/tasks"
  end

  private

  def task_params
    params.require(:task).permit(:title, :deadline, :description)
  end

  def find_task
    @project = Project.find(params[:project_id])
  end
end
