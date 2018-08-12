class Api::V1::ProjectsController < ApplicationController
  def index
    @projects = Project.all
    render json: @projects
  end

  def show
    @project = Project.find(params[:id])
    render json: @project
  end

  def create
    project = Project.create(projectname: params[:projectname], password: params[:password])
    if project.valid?
      render json: { token: issue_token({ id: project.id }) }
    else
      render json: { error: "Project not created" }
    end
  end

  def delete
    #delete project
  end
end
