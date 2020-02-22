class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def create
    project = Project.new(project_params)
    if project.save
      flash[:success] = 'プロジェクトの作成に成功しました。'
      redirect_to "/projects/#{project.id}/tasks"
    else
      flash.now[:danger] = 'プロジェクトの作成に失敗しました'
      redirect_to root_url
    end
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

end
