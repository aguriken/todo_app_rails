class TasksController < ApplicationController
  before_action :find_project
  def index 
    @tasks = @project.tasks
  end

  def new
  end

  def create
    @task = @project.tasks.build(task_params)
    if @task.save
      notifier = Slack::Notifier.new ENV['Webhook_URL'],
      channel: "#中原さんオリアプ研修", 
      username: "Notification"
      notifier.ping "#{@task.project.name}で#{@task.title}を作成しました。 \n 〆切は#{@task.deadline}です。"
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
    notifier = Slack::Notifier.new ENV['Webhook_URL'],
    channel: "#中原さんオリアプ研修", 
    username: "Notification"
    notifier.ping "#{task.project.name}で#{task.title}を更新しました。 \n 〆切は#{task.deadline}です。"
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
