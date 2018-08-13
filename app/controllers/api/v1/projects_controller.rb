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
    project = Project.create(name: params[:name], filepath: params[:filepath], user_id: params[:userId])
    if project.valid?
      render json: { token: issue_token({ id: project.id }) }
    else
      render json: { error: "Project not created" }
    end
  end

  def update
    project = Project.create(name: params[:name], filepath: params[:filepath], user_id: params[:userId])

    project = Project.find_by(name: 'David')
    project.update(name: 'Dave')
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
