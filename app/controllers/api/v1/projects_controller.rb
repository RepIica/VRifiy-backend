class Api::V1::ProjectsController < ApplicationController

  def index
    user = User.find(params[:userId])
    @projects = user.projects
    render json: @projects
  end

  def show
    @project = Project.find(params[:id])
    render json: @project
  end

  def create
    user = User.all.find(params[:userId])
    dir = "../VRify-frontend/public/#{user.name}"
    # dir = "../../../../../VRify-frontend/public/#{user.name}"
    Dir.mkdir dir unless File.exist? dir
    file = params[:fileContent]
    newFile = File.open(File.expand_path("#{dir}/#{params[:name]}.html"),"w")
    newFile.write(file)
    newFile.close
    project = Project.create(name: params[:name], filepath: "./#{user.name}/#{params[:name]}.html", user_id: params[:userId])
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
