class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def create
    project = Project.new(project_params)
    if project.save
      flash[:success] = 'Well Done! You successfully created new project'
      redirect_to "/projects/#{project.id}/tasks"
    else
      flash.now[:danger] = 'Error... Something went wrong'
      redirect_to root_url
    end
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

end
