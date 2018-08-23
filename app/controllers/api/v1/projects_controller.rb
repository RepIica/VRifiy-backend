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
    body = params[:fileContent]

    newFile = File.open(File.expand_path("#{dir}/#{params[:name]}.html"),"w")
      file.write(body)
      file.close
    end

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

  private

  def header
    '<head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

      <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Roboto:300,300italic,700,700italic">
      <link href="https://fonts.googleapis.com/css?family=Montserrat|Roboto:300,400|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
  		<link rel="stylesheet" media="screen" href="https://fontlibrary.org/face/montreal" type="text/css"/>

      <script src="https://aframe.io/releases/0.8.0/aframe.min.js"></script>
      <script src="https://unpkg.com/aframe-animation-component/dist/aframe-animation-component.min.js"></script>
      <script src="https://unpkg.com/aframe-event-set-component@^4.0.0/dist/aframe-event-set-component.min.js"></script>
      <script src="https://npmcdn.com/aframe-layout-component@3.0.1"></script>
      <script src="https://npmcdn.com/aframe-template-component@3.1.1"></script>
      <script src="https://unpkg.com/aframe-teleport-controls@0.2.0/dist/aframe-teleport-controls.min.js"></script>
      <script src="https://unpkg.com/aframe-controller-cursor-component@0.2.2/dist/aframe-controller-cursor-component.min.js"></script>
      <script src="https://unpkg.com/aframe-fps-look-controls-component/dist/aframe-fps-look-controls-component.min.js"></script>
      <script src="https://unpkg.com/super-hands@3.0.0/dist/super-hands.min.js"></script>
      <script src="https://cdn.rawgit.com/donmccurdy/aframe-extras/v4.1.2/dist/aframe-extras.min.js"></script>
      <script src="https://rawgit.com/feiss/aframe-environment-component/master/dist/aframe-environment-component.min.js"></script>
      <script src="./components/intersection-spawn.js"></script>
      <script src="./components/random-color.js"></script>
      <script src="./components/snap.js"></script>
      <script src="./components/aframe.propagate.js"></script>
      <title>VRifiy Project</title>
    </head>
    <body>
    '
  end

end
