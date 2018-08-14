class Api::V1::ProjectsController < ApplicationController
  def index
    # @projects = Project.all
    # render json: @projects
    @projects = Project.all.where(user_id: params[:userId]).map { |e| e.name  }
    render json: @projects
  end

  def show
    user = User.all.find(params[:userId])
    @projects = user.projects.map { |e| e.name  }
    render json: @projects
  end

  def create
    user = User.all.find(params[:userId])
    dir = "../VRify-frontend/public/#{user.name}"
    # dir = "../../../../../VRify-frontend/public/#{user.name}"
    Dir.mkdir dir unless File.exist? dir

    file = params[:fileContent]
    newFile = File.open(File.expand_path("#{dir}/#{params[:name]}.html"),"w")
    newFile.write(file)
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
