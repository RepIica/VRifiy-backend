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
    file = params[:fileContent]
    newFile = File.open("#{params[:name]}.txt","w")
    newFile.write(file)
    project = Project.create(name: params[:name], filepath: params[:filepath], user_id: params[:userId])
    if project.valid?
      render json: project
    else
      render json: { error: "Project not created" }
    end
  end

  def update
    project = Project.find_by(name: params[:name])
    project.update(name: params[:name], filepath: params[:filepath])
    if project.valid?
      render json: project
    else
      render json: { error: "Project not created" }
    end
  end

  def delete
    #delete project
  end
end
